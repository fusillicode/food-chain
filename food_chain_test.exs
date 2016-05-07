if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("food_chain.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule FoodChainTest do
  use ExUnit.Case

  test "says hello with no name" do
    assert HelloWorld.rock_n_roll() == "Hello, World!"
  end
end
