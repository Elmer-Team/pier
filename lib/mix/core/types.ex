defmodule Pier.Core.Types do

  require Logger
  defstruct [:keys]

  def run({'definitions', definitions}) do
    Enum.map(definitions, &build_definitions/1)
  end

  defp build_definitions({_key, properties}) do
      Enum.find(properties, &build_properties/1)
  end

  def build_type({'type', object_type}) do
    object_type
  end

  def build_properties(_) do

  end
end
