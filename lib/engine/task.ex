defmodule Pier.Engine.Task do
  alias Pier.Core.Request

  
  def task_logs(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/tasks/{id}/logs", opts[:path_params] || [], [:id])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  
  def task_inspect(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/tasks/{id}", opts[:path_params] || [], [:id])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  




end
