defmodule Pier.Engine.Node do
  alias Pier.Core.Request
  
  def node_update(opts) do

    query_params = Request.build_params(opts[:query_params] || [], version, :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/nodes/{id}/update, opts[:path_params] || [], id)
  end

  
  def node_delete(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/nodes/{id}, opts[:path_params] || [], id)
  end

  




end
