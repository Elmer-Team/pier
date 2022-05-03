defmodule Pier.Core.Request do
  alias Mint.HTTP
  alias Pier.Core.Response
  def build_params(opts, required_fields, :query) do
    if Enum.any?(required_fields, &Keyword.fetch(opts, &1) == :error) do
      :error
    else
      URI.encode_query(opts)
    end
  end

  def build_params(opts, required_fields, :body) do
    if Enum.any?(required_fields, &Keyword.fetch(opts, &1) == :error) do
      :error
    else
      Map.new(opts)
    end
  end

  def build_path(path, opts, required_fields) do

    if Enum.any?(required_fields, &Keyword.fetch(opts, &1) == :error) do
      :error
    else
      Enum.reduce(opts, path, fn {k, v}, acc -> String.replace(acc, "{#{k}}", v) end)
    end
    end



  def make_request(method, path, query_params, body_params) do
    {:ok, unix} = Application.fetch_env(:pier, :socket)
    {:ok, conn} = HTTP.connect(:http, {:local, unix}, 0, hostname: "localhost")
    uri = URI.merge(path, "?" <> query_params) |> to_string()
    case HTTP.request(conn, method, uri, [], Jason.encode!(body_params)) do
        {:ok, _conn, _request_ref} -> stream_response(conn, %Response{})
    end

  end

  defp stream_response(conn, body) do
    receive do
      message ->
        {:ok, conn, response} = HTTP.stream(conn, message)

        case reduce_response(response, body) do
          {:ok, %Response{done: true} = response} ->
            {:ok, response}

          {:ok, %Response{done: false} = response} ->
            stream_response(conn, response)
        end
    end
  end

  defp reduce_response(chunk, %Response{} = acc) do
    {:ok, Enum.reduce(chunk, acc, &parse_response/2)}
  end

  defp parse_response({:status, _request_ref, status}, acc) do
    %{acc | status: status}
  end

  defp parse_response({:headers, _request_ref, headers}, acc = %{headers: init}) do
    %{acc | headers: headers ++ init}
  end

  defp parse_response({:data, _request_ref, data}, acc = %{body: body}) do
    %{acc | body: body <> data}
  end

  defp parse_response({:done, _}, acc) do
    %{acc | done: true}
  end

  def decode(binary, transformer) do
    transformer.(binary)
  end
end
