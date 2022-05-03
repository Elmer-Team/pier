def <%= context.method_name %>(opts) do
    <%= if Map.has_key?(context, :query_params) do %>
      query_params = Request.build_params(opts[:query_params] || [], <%= inspect context.query_params.required %>, :query)
    <% end %>
    <%= if Map.has_key?(context, :body_params) do %>
      body_params = Request.build_params(opts[:body_params] || [], <%= inspect context.body_params.required %>, :body)
    <% end %>
    <%= if Map.has_key?(context, :path_params) do %>
      path_params = Request.build_path(<%= inspect context.path %>, opts[:path_params] || [], <%= inspect context.path_params.required %>)
    <% end %>

    Request.make_request(<%= inspect context.method %>, path_params, query_params, body_params)
  end
