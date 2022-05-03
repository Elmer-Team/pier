defmodule Pier.Engine.<%=  context.sub_module %> do
  alias Pier.Core.Request

  <%= for method <- context.methods do %>
  <%= Pier.Mix.Core.Method.render(method) %>
  <% end %>




end
