defmodule PersistMini.StackTest do
  use ExUnit.Case, async: true

  alias PersistMini.Stack

  describe "empty/0 and empty?/1" do
    test "returns an empty stack" do
      stack = Stack.empty()
      assert Stack.empty?(stack)
      assert Stack.to_list(stack) == []
    end
  end

  describe "push/2" do
    test "adds elements in LIFO order" do
      stack =
        Stack.empty()
        |> Stack.push(1)
        |> Stack.push(2)
        |> Stack.push(3)

      assert Stack.to_list(stack) == [3, 2, 1]
    end
  end

  describe "pop/1" do
    test "returns :empty when empty" do
      assert Stack.pop(Stack.empty()) == :empty
    end

    test "returns top and new stack" do
      stack =
        Stack.empty()
        |> Stack.push(:a)
        |> Stack.push(:b)

      assert {:ok, :b, new_stack} = Stack.pop(stack)
      assert Stack.to_list(new_stack) == [:a]
    end
  end

  describe "peek/1" do
    test "returns :empty when empty" do
      assert Stack.peek(Stack.empty()) == :empty
    end

    test "returns top without removing it" do
      stack =
        Stack.empty()
        |> Stack.push(:x)
        |> Stack.push(:y)

      assert {:ok, :y} = Stack.peek(stack)
      assert Stack.to_list(stack) == [:y, :x]
    end
  end
end
