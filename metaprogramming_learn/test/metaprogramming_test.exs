defmodule MetaprogrammingTest do
  import TUnit

  def run do
    assert 5 == 5
    assert 2 == 3
    assert 2 > 1
  end
end
