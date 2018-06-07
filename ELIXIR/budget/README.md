# How to Make this Budget
#=====================================

mix new budget
cd budget
mix run -e "Budget.Conversion.from_euro_to_dollor(15) |> IO.puts"

#==========================================



# Budget

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `budget` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:budget, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/budget](https://hexdocs.pm/budget).
