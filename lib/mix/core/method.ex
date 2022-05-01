defmodule Pier.Mix.Core.Method do
  require Logger
  alias Pier.Mix.Core.Method
  defstruct [:path, :docs, :parameters, method_name: nil, method: nil, module_name: nil]

  def build_methods({'paths', path_resources}) do
    Enum.map(path_resources, fn resource -> extract_methods(resource) end)
  end

  def extract_methods({path, methods}) do
    method = Enum.reduce(methods, %Method{path: path}, fn method, acc -> extract_method(method, acc) end)
    {method.module_name, method}
  end

  defp extract_method_name(methods) do
    Logger.info(methods)
    {_, operation_id} = Enum.find(methods, fn {key, _} -> key == 'operationId' end)
    Macro.underscore(List.to_string(operation_id))
  end

  defp extract_method({method, data}, state) do
    method_name = extract_method_name(data)
    module_name = extract_module_name(data)
    %{state | method: method, parameters: extract_params(data), method_name: method_name, module_name: module_name}
  end

  defp extract_params(params),
    do:
      Enum.find(params, fn {key, _} -> key == 'parameters' end)
      |> Pier.Mix.Core.Params.extract_params()

  defp extract_module_name(params) do
    {_, tags} = Enum.find(params, fn {key, _} -> key == 'tags' end)
    List.first(tags)
  end

  def render(%Method{} = method) do
    EEx.eval_file("priv/templates/method.exs", context: %{method_name: method.method_name})
  end

end
