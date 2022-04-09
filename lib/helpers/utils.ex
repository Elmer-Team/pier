defmodule Pier.Helpers.Utils do

  def is_uppercase?(char) do

    String.upcase(char) == char
  end

  def convert_key(key, enforced_keys) do
    enforced_keys = for key <- enforced_keys, into: [] do
      Atom.to_string(key)
    end
    if key in enforced_keys do
      String.to_existing_atom(key)
    end
  end
end
