defmodule Pier.Engine.Image do
  alias Mint.HTTP
  alias Pier.Core.Response

  def index do
    {:ok, unix} = Application.fetch_env(:pier, :socket)
    {:ok, conn} = HTTP.connect(:http, {:local, unix}, 0, hostname: "localhost")
    request(conn, "GET", "/images/json", [], nil)
  end

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
          {:ok, %Response{done: true} = response} -> {:ok, response}
          {:ok, %Response{done: false} = response} -> stream_response(conn, body)
        end
    end
  end

  defp reduce_response(chunk, %Response{}) do
    Enum.reduce(chunk, &parse_response/1)
  end



end
