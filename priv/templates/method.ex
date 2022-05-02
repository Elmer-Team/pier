def <%= context.method_name %>(opts) do

    query_params = Request.build_params(opts[:query_params] || [], <%= context.query_params.required %>, :query)
    body_params = Request.build_params(opts[:body_params] || [], <%=context.body_params.required %>, :body)

    path_params = Request.build_path(<%= inspect context.path %>, opts[:path_params] || [], <%=context.path_params.required %>)
  end
