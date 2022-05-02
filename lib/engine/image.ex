defmodule Pier.Engine.Image do
  alias Pier.Core.Request
  
  def image_load(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/load, opts[:path_params] || [], )
  end

  
  def image_get_all(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/get, opts[:path_params] || [], )
  end

  
  def image_get(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/{name}/get, opts[:path_params] || [], name)
  end

  
  def image_commit(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/commit, opts[:path_params] || [], )
  end

  
  def image_prune(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/prune, opts[:path_params] || [], )
  end

  
  def image_search(opts) do

    query_params = Request.build_params(opts[:query_params] || [], term, :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/search, opts[:path_params] || [], )
  end

  
  def image_delete(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/{name}, opts[:path_params] || [], name)
  end

  
  def image_tag(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/{name}/tag, opts[:path_params] || [], name)
  end

  
  def image_push(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/{name}/push, opts[:path_params] || [], name)
  end

  
  def image_history(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/{name}/history, opts[:path_params] || [], name)
  end

  
  def image_inspect(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/{name}/json, opts[:path_params] || [], name)
  end

  
  def image_create(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/images/create, opts[:path_params] || [], )
  end

  
  def build_prune(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/build/prune, opts[:path_params] || [], )
  end

  
  def image_build(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/build, opts[:path_params] || [], )
  end

  




end
