defmodule  Pier.Helpers.Snake do
  import Pier.Helpers.Utils
  def transform(<<h::utf8, rest::binary>>) do
      do_transform(h, 0, rest)
  end


  defp do_transform(char, 0, <<n::utf8, rest::binary>> = _rest)  do

    if is_uppercase?(<<char>>) do

      String.downcase(<<char>>) <> do_transform(n, 0 + 1, rest)
    else
      <<char>> <> do_transform(n, 0 + 1, rest)
    end

  end

  defp do_transform(?_, index, <<n::utf8, rest::binary>> = _rest)  do
    <<?_>> <> do_transform(n, index + 1, rest)
  end

  defp do_transform(stop, _, <<>>) do
    if is_uppercase?(<<stop>>) do

      String.downcase(<<stop>>)
    else
      <<stop>>
    end
  end
  defp do_transform(char, index, <<n::utf8, rest::binary>> = _rest) do
    if is_uppercase?(<<char>>) do

      <<?_>>  <> String.downcase(<<char>>) <> do_transform(n, index + 1, rest)
    else
      <<char>> <> do_transform(n, index + 1, rest)
    end
  end


end
