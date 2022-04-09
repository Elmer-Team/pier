defmodule Pier.Engine.ImageTest do
  use ExUnit.Case
  alias Pier.Engine.Image
  test "list all images" do
    Image.index()
  end
end
