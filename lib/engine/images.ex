defmodule Pier.Engine.Image do
  alias Mint.HTTP
  import Pier.Core.Request
  alias Pier.Helpers.Decode
  defstruct [:containers, :created, :id, :labels, :parent_id, :repo_digests, :size, :shared_size, :virtual_size, :repo_tags]
  def index do
    {:ok, unix} = Application.fetch_env(:pier, :socket)
    {:ok, conn} = HTTP.connect(:http, {:local, unix}, 0, hostname: "localhost")
    {:ok, response} = request(conn, "GET", "/images/json", [], nil)




     {:ok, %{response |  body: decode(response.body)}}
  end



  defp decode(v) do

  transformed_response = Jason.decode!(v) |> Decode.transform(&Pier.Helpers.Snake.transform/1, [enforce_keys: Map.keys(%Pier.Engine.Image{})])
  for i <- transformed_response do
    Kernel.struct!(__MODULE__, i)
  end
  end


end
