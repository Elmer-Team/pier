defmodule PierTest.Helpers.Utils do
  use ExUnit.Case
  alias Pier.Helpers.Utils

  test "greets the world" do
    <<h::utf8, _::binary>> = "hello world"
    assert Utils.is_uppercase?(<<h>>) == false
    <<h::utf8, _::binary>> = "Hello world"
    assert Utils.is_uppercase?(<<h>>)

  end
end
