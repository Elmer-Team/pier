defmodule Pier.Mix.Core.Params do
  require Logger
  def extract_params({'parameters', parameters}) do
    parameters
    |> Enum.map(&parse_param_fn/1)
  end

  def extract_params(param) do
    param
  end



  defp parse_param_fn(param) do
    Map.new(param)
  end
  end
