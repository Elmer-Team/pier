defmodule Pier.Core.Request do
  alias Pier.Core.Response

  alias Mint.HTTP

  def request(conn, method, path, headers, body) do
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
