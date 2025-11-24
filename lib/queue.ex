defmodule PersistMini.Queue do
  @moduledoc """
  An immutable FIFO Queue implemented using the classic two-list technique.

  The queue maintains:
    * front: a list of elements ready to be dequeued
    * rear: elements added most recently (in reverse order)

  When front becomes empty, rear is reversed to maintain correct order.
  This ensures efficient enqueue and dequeue operations while preserving immutability.
  """

  defstruct front: [], rear: []

  @type t(a) :: %__MODULE__{front: [a], rear: [a]}

  @doc "Creates an empty queue."
  @spec empty() :: t(any)
  def empty do
    %__MODULE__{front: [], rear: []}
  end

  @doc "Returns true if the queue is empty."
  @spec empty?(t(any)) :: boolean
  def empty?(%__MODULE__{front: [], rear: []}), do: true
  def empty?(_), do: false

  @doc "Adds an element to the queue."
  @spec enqueue(t(a), a) :: t(a) when a: var
  def enqueue(%__MODULE__{front: f, rear: r}, item) do
    rebalance(%__MODULE__{front: f, rear: [item | r]})
  end

  @doc """
  Removes the first element from the queue.

  Returns:
    * {:ok, item, new_queue}
    * :empty
  """
  @spec dequeue(t(a)) :: {:ok, a, t(a)} | :empty when a: var
  def dequeue(%__MODULE__{front: [], rear: []}), do: :empty

  def dequeue(%__MODULE__{front: [item | rest], rear: rear}) do
    {:ok, item, rebalance(%__MODULE__{front: rest, rear: rear})}
  end

  @doc "Returns the front element without removing it."
  @spec front(t(a)) :: {:ok, a} | :empty when a: var
  def front(%__MODULE__{front: [], rear: []}), do: :empty
  def front(%__MODULE__{front: [item | _]}), do: {:ok, item}
  def front(%__MODULE__{front: [], rear: r}), do: {:ok, List.last(r)}

  @doc "Converts the queue into a normal list."
  @spec to_list(t(a)) :: [a] when a: var
  def to_list(%__MODULE__{front: f, rear: r}) do
    f ++ Enum.reverse(r)
  end

  defp rebalance(%__MODULE__{front: [], rear: r}) do
    %__MODULE__{front: Enum.reverse(r), rear: []}
  end

  defp rebalance(queue), do: queue
end
