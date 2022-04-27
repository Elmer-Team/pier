defmodule Pier.Core.Response do
  defstruct [:status, done: false, body: "", headers: []]
end
