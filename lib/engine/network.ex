defmodule Pier.Engine.Network do
  alias Pier.Core.Request
  
  def network_prune(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/networks/prune, opts[:path_params] || [], )
  end

  
  def network_disconnect(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], container, :body)

    path_params = Request.build_path(/v1.41/networks/{id}/disconnect, opts[:path_params] || [], id)
  end

  
  def network_connect(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], container, :body)

    path_params = Request.build_path(/v1.41/networks/{id}/connect, opts[:path_params] || [], id)
  end

  
  def network_create(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], networkConfig, :body)

    path_params = Request.build_path(/v1.41/networks/create, opts[:path_params] || [], )
  end

  
  def network_delete(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/networks/{id}, opts[:path_params] || [], id)
  end

  




end
