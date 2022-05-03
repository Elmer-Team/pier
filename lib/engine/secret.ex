defmodule Pier.Engine.Secret do
  alias Pier.Core.Request

  
  def secret_update(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [:version], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/secrets/{id}/update", opts[:path_params] || [], [:id])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def secret_delete(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/secrets/{id}", opts[:path_params] || [], [:id])
    

    Request.make_request("DELETE", path_params, query_params, body_params)
  end

  
  def secret_create(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/secrets/create", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  




end
