# Pier

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `pier` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:pier, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/pier](https://hexdocs.pm/pier).


# Pier 
 Pier is an attempt to build a docker library by using `EEx` [and the open api v2 specifications](https://swagger.io/specification/v2/)

## Description.
The library uses `:yamerl` to read and build a nested list of tuples represent a key and it's children. That is then parsed using pattern matching and loops. The result is a map with a list of modules and a list of methods contained in that module. [Read the code here](https://github.com/PabloG6/pier/lib/mix/tasks/compile.pier.ex)