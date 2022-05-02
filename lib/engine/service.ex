defmodule Pier.Engine.Service do
  alias Pier.Core.Request
  
  def service_logs(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/services/{id}/logs, opts[:path_params] || [], id)
  end

  
  def service_update(opts) do

    query_params = Request.build_params(opts[:query_params] || [], version, :query)
    body_params = Request.build_params(opts[:body_params] || [], body, :body)

    path_params = Request.build_path(/v1.41/services/{id}/update, opts[:path_params] || [], id)
  end

  
  def service_delete(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/services/{id}, opts[:path_params] || [], id)
  end

  
  def service_create(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], body, :body)

    path_params = Request.build_path(/v1.41/services/create, opts[:path_params] || [], )
  end

  




end
