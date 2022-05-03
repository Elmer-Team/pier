defmodule Pier.Engine.Volume do
  alias Pier.Core.Request

  
  def volume_prune(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/volumes/prune", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def volume_delete(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/volumes/{name}", opts[:path_params] || [], [:name])
    

    Request.make_request("DELETE", path_params, query_params, body_params)
  end

  
  def volume_create(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [:volumeConfig], :body)
    
    
      path_params = Request.build_path("/v1.41/volumes/create", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  




end
