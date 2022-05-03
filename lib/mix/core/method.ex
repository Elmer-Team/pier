defmodule Pier.Mix.Core.Method do
  require Logger
  alias Pier.Mix.Core.Method

  defstruct [
    :path,
    :docs,
    :parameters,
    method_name: nil,
    method: nil,
    module_name: nil,
    base_path: nil
  ]

  def build_methods({'paths', path_resources}, opts \\ []) do
    base_path = Keyword.fetch!(opts, :base_path)
    Enum.map(path_resources, fn resource -> extract_methods(resource, base_path: base_path) end)
  end

  def extract_methods({path, methods}, opts) do
    base_path = Keyword.fetch!(opts, :base_path)

    method =
      Enum.reduce(methods, %Method{path: path, base_path: base_path}, fn method, acc ->
        extract_method(method, acc)
      end)

    {method.module_name, method}
  end

  defp extract_method_name(methods) do
    {_, operation_id} = Enum.find(methods, fn {key, _} -> key == 'operationId' end)
    Macro.underscore(List.to_string(operation_id))
  end

  defp extract_method({method, data}, state) do
    method_name = extract_method_name(data)
    module_name = extract_module_name(data)

    %{
      state
      | method: method,
        parameters: extract_params(data),
        method_name: method_name,
        module_name: module_name
    }
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
    path = build_url(method.base_path, method.path)
    query_params = build_params(method.parameters, 'query')
    body_params = build_params(method.parameters, 'body')
    path_params = build_params(method.parameters, 'path')
    context = %{method_name: method.method_name, path: path,  query_params: query_params, body_params: body_params, path_params: path_params, method: List.to_string(method.method) |> String.upcase()}
    Logger.info("#{inspect(context)}")
    EEx.eval_file("priv/templates/method.ex",
        context: context
      )


  end

  def build_url(base_path, url), do: Path.join(base_path, url)

  def build_params(parameters, field) when is_list(parameters) do

    filtered_params = Enum.filter(parameters, fn parameters -> parameters['in'] == field end)
    Enum.reduce(filtered_params, %{required: [], optional: []}, &organize_param_list/2)
  end

  def build_params(%{'name' => name, 'in' => belongs_to} = parameters, field) when is_map(parameters) do
    param_filter = %{required: [], optional: []}
    if(belongs_to == field and parameters['required']) do
      %{param_filter | required: [List.to_atom(name) | param_filter.required]}
    else
      %{param_filter | optional: [List.to_atom(name) | param_filter.optional]}

    end
  end

  def build_params(_, _) do
    %{required: [], optional: []}
  end



  defp organize_param_list(%{'name' => name, 'required' => true}, acc) do
    %{acc | required: [List.to_atom(name) | acc.required]}
  end

  defp organize_param_list(%{'name' => name}, acc) do
    %{acc | optional: [List.to_atom(name) | acc.required]}
  end






end
