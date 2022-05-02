defmodule Pier.Engine.Container do
  alias Pier.Core.Request
  
  def container_prune(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/prune, opts[:path_params] || [], )
  end

  
  def put_container_archive(opts) do

    query_params = Request.build_params(opts[:query_params] || [], path, :query)
    body_params = Request.build_params(opts[:body_params] || [], inputStream, :body)

    path_params = Request.build_path(/v1.41/containers/{id}/archive, opts[:path_params] || [], id)
  end

  
  def container_delete(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}, opts[:path_params] || [], id)
  end

  
  def container_wait(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/wait, opts[:path_params] || [], id)
  end

  
  def container_attach_websocket(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/attach/ws, opts[:path_params] || [], id)
  end

  
  def container_attach(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/attach, opts[:path_params] || [], id)
  end

  
  def container_unpause(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/unpause, opts[:path_params] || [], id)
  end

  
  def container_pause(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/pause, opts[:path_params] || [], id)
  end

  
  def container_rename(opts) do

    query_params = Request.build_params(opts[:query_params] || [], name, :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/rename, opts[:path_params] || [], id)
  end

  
  def container_update(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], update, :body)

    path_params = Request.build_path(/v1.41/containers/{id}/update, opts[:path_params] || [], id)
  end

  
  def container_kill(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/kill, opts[:path_params] || [], id)
  end

  
  def container_restart(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/restart, opts[:path_params] || [], id)
  end

  
  def container_stop(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/stop, opts[:path_params] || [], id)
  end

  
  def container_start(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/start, opts[:path_params] || [], id)
  end

  
  def container_resize(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/resize, opts[:path_params] || [], id)
  end

  
  def container_stats(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/stats, opts[:path_params] || [], id)
  end

  
  def container_export(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/export, opts[:path_params] || [], id)
  end

  
  def container_changes(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/changes, opts[:path_params] || [], id)
  end

  
  def container_logs(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/logs, opts[:path_params] || [], id)
  end

  
  def container_top(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/top, opts[:path_params] || [], id)
  end

  
  def container_inspect(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], , :body)

    path_params = Request.build_path(/v1.41/containers/{id}/json, opts[:path_params] || [], id)
  end

  
  def container_create(opts) do

    query_params = Request.build_params(opts[:query_params] || [], , :query)
    body_params = Request.build_params(opts[:body_params] || [], body, :body)

    path_params = Request.build_path(/v1.41/containers/create, opts[:path_params] || [], )
  end

  




end
