defmodule Mix.Tasks.Pier.Compile do
  use Mix.Task
  require Logger
  alias Pier.Mix.Core.Method
  alias Pier.Core.Types
  alias Mix.Tasks.Pier.Compile

  def run(_) do
    spec = eval_spec()
    {'basePath', base_path} = Enum.find(spec, fn {key, _} -> key == 'basePath' end)
    spec
    |> Enum.find(fn {key, _} -> key == 'paths' end)
    |> Method.build_methods([base_path: base_path])
    |> Enum.reduce(%{}, &map_methods_to_module(&1, &2))
    |> evaluate_modules


  end

  def map_methods_to_module({key, method}, module) do
    Map.update(module, List.to_string(key), [], fn val -> [method | val] end)
  end

  defp evaluate_modules(modules) do
    Logger.info("evaluating modules")

    Enum.map(modules, fn {module_name, methods} -> Compile.render(module_name, methods) end)
  end


  def render(module_name, methods) do
    eval = EEx.eval_file("priv/templates/engine.ex", context: %{sub_module: module_name, methods: methods})
    File.write("lib/engine/#{String.downcase(module_name)}.ex", eval)

  end


  def eval_spec() do
    case File.read("priv/spec/current.yaml") do
      {:ok, contents} ->
        :yamerl.decode(contents)
        |> parse_documents()
    end
  end

  defp parse_documents([document | []]), do: document

  defp parse_documents(_),
    do:
      raise("""
        Can only parse a single document. Please check if yaml spec is corrupted.
      """)
end
