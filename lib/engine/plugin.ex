defmodule Pier.Engine.Plugin do
  alias Pier.Core.Request

  
  def plugin_set(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/{name}/set", opts[:path_params] || [], [:name])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def plugin_push(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/{name}/push", opts[:path_params] || [], [:name])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def plugin_create(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [:name], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/create", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def plugin_upgrade(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [:remote], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/{name}/upgrade", opts[:path_params] || [], [:name])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def plugin_disable(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/{name}/disable", opts[:path_params] || [], [:name])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def plugin_enable(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/{name}/enable", opts[:path_params] || [], [:name])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def plugin_delete(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/{name}", opts[:path_params] || [], [:name])
    

    Request.make_request("DELETE", path_params, query_params, body_params)
  end

  
  def plugin_inspect(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/{name}/json", opts[:path_params] || [], [:name])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  
  def plugin_pull(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [:remote], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/pull", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def get_plugin_privileges(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [:remote], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/plugins/privileges", opts[:path_params] || [], [])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  




end
