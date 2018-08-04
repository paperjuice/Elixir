defmodule MetaprogrammingTest do
  use TUnit

  test "Test 1" do
    assert 5 == 5
    assert 2 == 3
    assert 2 > 1
  end

  test "Test 2" do
    assert 3 == 3
    assert 5 > 8
  end
end
