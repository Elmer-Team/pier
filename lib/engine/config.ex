defmodule Pier.Engine.Config do
  alias Pier.Core.Request

  
  def config_update(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [:version], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/configs/{id}/update", opts[:path_params] || [], [:id])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def config_delete(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/configs/{id}", opts[:path_params] || [], [:id])
    

    Request.make_request("DELETE", path_params, query_params, body_params)
  end

  
  def config_create(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/configs/create", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  




end
