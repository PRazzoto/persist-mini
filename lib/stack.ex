defmodule PersistMini.Stack do
  @moduledoc """
  An immutable LIFO Stack.

  This module demonstrates functional programming techniques such as immutability,
  pattern matching, and structural sharing. All operations return new versions
  of the stack rather than modifying existing structures.
  """

  defstruct items: []

  @type t(a) :: %__MODULE__{items: [a]}

  @doc "Returns an empty stack."
  @spec empty() :: t(any)
  def empty do
    %__MODULE__{items: []}
  end

  @doc "Returns true if the stack is empty."
  @spec empty?(t(any)) :: boolean
  def empty?(%__MODULE__{items: []}), do: true
  def empty?(_), do: false

  @doc "Pushes a new element on top of the stack."
  @spec push(t(a), a) :: t(a) when a: var
  def push(%__MODULE__{items: items}, element) do
    %__MODULE__{items: [element | items]}
  end

  @doc """
  Removes and returns the top element.

  Returns:
    * {:ok, top, new_stack}
    * :empty
  """
  @spec pop(t(a)) :: {:ok, a, t(a)} | :empty when a: var
  def pop(%__MODULE__{items: []}), do: :empty

  def pop(%__MODULE__{items: [top | rest]}) do
    {:ok, top, %__MODULE__{items: rest}}
  end

  @doc "Returns the top element without removing it."
  @spec peek(t(a)) :: {:ok, a} | :empty when a: var
  def peek(%__MODULE__{items: []}), do: :empty
  def peek(%__MODULE__{items: [top | _]}), do: {:ok, top}

  @doc "Converts the stack to a list."
  @spec to_list(t(a)) :: [a] when a: var
  def to_list(%__MODULE__{items: items}), do: items
end
