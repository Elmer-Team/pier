defmodule Pier.Engine.Image do

  import Pier.Core.Request
  alias Pier.Helpers.Decode
  defstruct [:containers, :created, :id, :labels, :parent_id, :repo_digests, :size, :shared_size, :virtual_size, :repo_tags]
  def index do

    {:ok, response} = request("GET", "/images/json", [], nil)




     {:ok, %{response |  body: decode(response.body)}}
  end



  defp decode(v) do

  transformed_response = Jason.decode!(v) |> Decode.transform(&Pier.Helpers.Snake.transform/1, [enforce_keys: Map.keys(%Pier.Engine.Image{})])
  for i <- transformed_response do
    Kernel.struct!(__MODULE__, i)
  end
  end

  def build(params, path) do
    build_tar_list(path)
    request("POST", "/build", [], params)
  end


  def build_tar_package(path), do: build_tar_list(path)

  defp reject_files(path) do
    if File.exists?(Path.join(path, ".gitignore")) do
      with {:ok, content} <- File.read(Path.join(path, ".gitignore")) do
        IO.puts content
      end
    end
  end

  defp build_tar_list(path) do

    reject_files(path)
    if File.dir?(path) do

      File.ls!(path) |>
      Enum.map(&(Path.join(path, &1)))
      |>
      Enum.map(
        &build_tar_list/1
      )


    else

      path
    end
  end





end
