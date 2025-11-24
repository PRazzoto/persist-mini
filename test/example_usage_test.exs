defmodule PersistMini.ExampleUsageTest do
  use ExUnit.Case, async: true

  alias PersistMini.Stack
  alias PersistMini.Queue

  describe "Stack: reverse a list" do
    test "reverses a list using stack" do
      list = [1, 2, 3, 4, 5]
      # Push all items onto stack
      stack = Enum.reduce(list, Stack.empty(), fn el, stk -> Stack.push(stk, el) end)
      # Pop all items to get reversed list
      reversed = pop_all(stack, [])
      assert reversed == Enum.reverse(list)
    end

    defp pop_all(stack, acc) do
      case Stack.pop(stack) do
        {:ok, item, rest} -> pop_all(rest, acc ++ [item])
        :empty -> acc
      end
    end
  end

  describe "Queue: simple order processing" do
    test "simulate processing orders in FIFO order" do
      orders = ["Order A", "Order B", "Order C"]
      queue = Enum.reduce(orders, Queue.empty(), fn o, q -> Queue.enqueue(q, o) end)
      processed = dequeue_all(queue, [])
      # processed in order sent in
      assert processed == orders
    end

    defp dequeue_all(queue, acc) do
      case Queue.dequeue(queue) do
        {:ok, item, rest} -> dequeue_all(rest, acc ++ [item])
        :empty -> acc
      end
    end
  end
end
