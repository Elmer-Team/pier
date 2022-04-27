defmodule Pier.Helpers.Decode do


  alias Pier.Helpers.Utils
  def transform(map, fun, opts \\ []) do

    keywords = Keyword.fetch!(opts, :enforce_keys)
    do_transform(map, fun, keywords)
  end

  defp do_transform(map, fun, keywords) when is_map(map) do

    for {k, v} <- map, into: %{} do
      {Utils.convert_key(fun.(k), keywords), do_transform(v, fun, keywords)}
    end
  end


  defp do_transform(list, fun, keywords) when is_list(list) do

    Enum.map(list,  fn i -> do_transform(i, fun, keywords) end)
  end

  defp do_transform(v, _, _) when is_binary(v) do
    v
  end

  defp do_transform(v, _, _) do

    v
  end


end
