defmodule Pier.Engine.Exec do
  alias Pier.Core.Request

  
  def exec_inspect(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/exec/{id}/json", opts[:path_params] || [], [:id])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  
  def exec_resize(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/exec/{id}/resize", opts[:path_params] || [], [:id])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def exec_start(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/exec/{id}/start", opts[:path_params] || [], [:id])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  




end
