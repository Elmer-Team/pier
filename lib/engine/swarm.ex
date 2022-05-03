defmodule Pier.Engine.Swarm do
  alias Pier.Core.Request

  
  def swarm_unlock(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [:body], :body)
    
    
      path_params = Request.build_path("/v1.41/swarm/unlock", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def swarm_unlockkey(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/swarm/unlockkey", opts[:path_params] || [], [])
    

    Request.make_request("GET", path_params, query_params, body_params)
  end

  
  def swarm_update(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [:version], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [:body], :body)
    
    
      path_params = Request.build_path("/v1.41/swarm/update", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def swarm_leave(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [], :body)
    
    
      path_params = Request.build_path("/v1.41/swarm/leave", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def swarm_join(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [:body], :body)
    
    
      path_params = Request.build_path("/v1.41/swarm/join", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  
  def swarm_init(opts) do
    
      query_params = Request.build_params(opts[:query_params] || [], [], :query)
    
    
      body_params = Request.build_params(opts[:body_params] || [], [:body], :body)
    
    
      path_params = Request.build_path("/v1.41/swarm/init", opts[:path_params] || [], [])
    

    Request.make_request("POST", path_params, query_params, body_params)
  end

  




end
