defmodule Pier.Engine.ImageTest do
  use ExUnit.Case
  alias Pier.Engine.Image
  test "list all images" do
    {:ok, response} = Image.index()

  end
end
