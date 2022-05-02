defmodule Pier.Core.Request do


  def build_params(opts, required_fields, :query) do
    if Enum.any?(required_fields, &Keyword.fetch(opts, &1) == :error) do
      :error
    else
      URI.encode_query(opts)
    end
  end

  def build_params(opts, required_fields, :body) do
    if Enum.any?(required_fields, &Keyword.fetch(opts, &1) == :error) do
      :error
    else
      Map.new(opts)
    end
  end

  def build_path(path, opts, required_fields) do
    if Enum.any?(required_fields, &Keyword.fetch(opts, &1) == :error) do
      :error
    else
      Enum.reduce(opts, path, fn {k, v}, acc -> String.replace(acc, "{#{k}}", v) end)
    end
    end

end
