defmodule Pier.Storage.Tar do
  defstruct [:path, :name]
  use GenServer

  @type t():: %__MODULE__{
    path: String.t(),
    name: String.t()
  }
  def init(state) do
    {:ok, state}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  def create(pid, path) do
    GenServer.call(pid, {:create, %{path: path}})
  end

  def handle_call(:create, state) do

    {:ok, state}
  end

  def build_tar_package(path) do
    if File.dir?(path) do
      basename = Path.basename(path)
    build_tar_list(path)
    |> add(basename)
    else

    end
  end



  defp build_tar_list(path) do
    if File.dir?(path) do
      File.ls!(path)
      |> Enum.map(&Path.join(path, &1))
      |> Enum.map(&build_tar_list/1)

    else

      path
    end
  end



  def add(path, basename) when is_binary(path) do
    with {:ok, content} <- File.read(path),
        path_list <- Path.split(path),
    index when is_number(index) <- path_list |> Enum.find_index(fn x -> basename == x end),
        {_abs_parent, filename} <- Enum.split(path_list, index) do
        {Path.join(filename), content}


    end
  end

  def add(path, basename) when is_list(path) do
    Enum.map(path, &add(&1, basename)) |> List.flatten
  end


end
