defmodule Pier.Core.Request do
  alias Pier.Core.Response

  alias Mint.HTTP

  def request(method, path, headers, body) do
    {:ok, unix} = Application.fetch_env(:pier, :socket)
    {:ok, conn} = HTTP.connect(:http, {:local, unix}, 0, hostname: "localhost")
    case HTTP.request(conn, method, path, headers, body) do
      {:ok, conn, _request_ref} -> stream_response(conn, %Response{})
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

  defp parse_response({:headers, _request_ref, headers}, %{headers: init} = acc) do
    %{acc | headers: headers ++ init}
  end

  defp parse_response({:data, _request_ref, data}, %{body: body} = acc) do
    %{acc | body: body <> data}
  end

  defp parse_response({:done, _}, acc) do
    %{acc | done: true}
  end

  def decode(binary, transformer) do
    transformer.(binary)
  end
end
