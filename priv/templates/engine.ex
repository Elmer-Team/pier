defmodule Pier.Engine.<%=  context.sub_module %> do

  <%= for method <- context.methods do %>
  <%= Pier.Mix.Core.Method.render(method) %>
  <% end %>




end
