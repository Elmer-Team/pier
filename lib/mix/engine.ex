defmodule Mix.Engine do
  defstruct  name: nil,
    module: Pier.Engine,
    sub_module: nil,
    methods: [],
    template_path: "priv/templates/engine.ex"


  def new() do

  end


end
