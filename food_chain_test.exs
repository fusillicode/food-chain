if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("food_chain.exs")
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule FoodChainTest do
  use ExUnit.Case

  test "rock_n_roll with :fly" do
    assert FoodChain.rock_n_roll(:fly) == """
    I know an old lady who swallowed a fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """
  end

  test "rock_n_roll with :spider" do
    assert FoodChain.rock_n_roll(:spider) == """
    I know an old lady who swallowed a spider.
    It wriggled and jiggled and tickled inside her.
    She swallowed the spider to catch the fly.
    I don't know why she swallowed the fly. Perhaps she'll die.
    """
  end
end
