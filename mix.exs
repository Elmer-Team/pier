defmodule Pier.MixProject do
  use Mix.Project

  def project do
    [
      app: :pier,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,

      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :yamerl]
    ]
  end



  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6.4", only: [:dev, :test], runtime: false},
      {:castore, "~> 0.1.0"},
      {:mint, "~> 1.0"},
      {:yamerl, "~> 0.8.0"},
      {:accent, "~> 1.1"}

      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
