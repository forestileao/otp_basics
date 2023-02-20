defmodule OtpBasicsTest do
  use ExUnit.Case
  doctest OtpBasics

  test "greets the world" do
    assert OtpBasics.hello() == :world
  end
end
