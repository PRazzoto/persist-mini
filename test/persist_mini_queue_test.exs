defmodule PersistMini.QueueTest do
  use ExUnit.Case, async: true

  alias PersistMini.Queue

  describe "empty/0" do
    test "returns an empty queue" do
      queue = Queue.empty()
      assert Queue.empty?(queue)
      assert Queue.to_list(queue) == []
    end
  end

  describe "enqueue/2" do
    test "adds in FIFO order" do
      queue =
        Queue.empty()
        |> Queue.enqueue(1)
        |> Queue.enqueue(2)
        |> Queue.enqueue(3)

      assert Queue.to_list(queue) == [1, 2, 3]
    end
  end

  describe "dequeue/1" do
    test "returns :empty when queue is empty" do
      assert Queue.dequeue(Queue.empty()) == :empty
    end

    test "removes in FIFO order" do
      queue =
        Queue.empty()
        |> Queue.enqueue(:a)
        |> Queue.enqueue(:b)
        |> Queue.enqueue(:c)

      assert {:ok, :a, q2} = Queue.dequeue(queue)
      assert {:ok, :b, q3} = Queue.dequeue(q2)
      assert {:ok, :c, q4} = Queue.dequeue(q3)
      assert Queue.dequeue(q4) == :empty
    end
  end

  describe "front/1" do
    test "returns :empty when empty" do
      assert Queue.front(Queue.empty()) == :empty
    end

    test "returns first element without removing it" do
      queue =
        Queue.empty()
        |> Queue.enqueue(10)
        |> Queue.enqueue(20)

      assert {:ok, 10} = Queue.front(queue)
      assert Queue.to_list(queue) == [10, 20]
    end
  end
end
