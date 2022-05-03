defmodule Pier.Engine.System do
  alias Pier.Core.Request

  
  def system_data_usage(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/system/df", opts[:path_params] || [], [])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  
  def system_events(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/events", opts[:path_params] || [], [])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  
  def system_ping_head(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/_ping", opts[:path_params] || [], [])
    

    Request.make_request("HEAD", path_params, query_params, body_params)
  end

  
  def system_version(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/version", opts[:path_params] || [], [])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  
  def system_info(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/info", opts[:path_params] || [], [])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  




end
