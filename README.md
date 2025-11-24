# PersistMini

PersistMini is a minimal Elixir library that provides immutable data structures for functional programming: a LIFO Stack and a FIFO Queue. These implementations are educational and practical, showcasing how to build and work with immutable collections in Elixir.

## Features

- **Stack** (LIFO)
  - `empty/0`: Create a new empty stack
  - `empty?/1`: Check if the stack is empty
  - `push/2`: Push a new element onto the stack
  - `pop/1`: Remove and return the top element
  - `peek/1`: View the top element without removing
  - `to_list/1`: Convert the stack to a list

- **Queue** (FIFO)
  - `empty/0`: Create a new empty queue
  - `empty?/1`: Check if the queue is empty
  - `enqueue/2`: Add an element to the rear
  - `dequeue/1`: Remove and return the front element
  - `front/1`: View the front element without removing
  - `to_list/1`: Convert the queue to a list
  - `rebalancing/1`: Private function that automatically restores the correct order by reversing the rear list into the front when the front becomes empty

## Installation

Add `persist_mini` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:persist_mini, "~> 0.1.0"}
  ]
end
```

Get dependencies:

```sh
mix deps.get
```

## Usage

### Stack Example

```elixir
alias PersistMini.Stack

stack = Stack.empty()
stack = stack |> Stack.push(1) |> Stack.push(2)
{:ok, top, stack2} = Stack.pop(stack)     # {:ok, 2, %Stack{items: [1]}}
peeked = Stack.peek(stack2)               # {:ok, 1}
is_empty = Stack.empty?(stack2)           # false
list = Stack.to_list(stack2)              # [1]
```

### Queue Example

```elixir
alias PersistMini.Queue

queue = Queue.empty()
queue = queue |> Queue.enqueue(:a) |> Queue.enqueue(:b)
{:ok, front, queue2} = Queue.dequeue(queue)  # {:ok, :a, %Queue{front: [], rear: [:b]}}
peeked = Queue.front(queue2)                 # {:ok, :b}
is_empty = Queue.empty?(queue2)              # false
list = Queue.to_list(queue2)                 # [:b]
```


# Project Summary & Functional Programming Insights 
## Summary of the Idea

PersistMini was created as an educational library to demonstrate how immutable data structures can be implemented in a functional programming language such as Elixir. Instead of relying on mutation, the library shows how to build and manipulate a Stack (LIFO) and a Queue (FIFO) by returning new versions of the structure after each operation.

These implementations highlight key functional programming concepts:

- **Immutability**
- **Structural sharing**
- **Persistent data structures**
- **Pattern matching**
- **Pure function design**

The library aims to be simple, clean, and easy to understand while still being realistic enough to teach practical FP patterns.

## Lessons Learned About Functional Programming
### 1. Immutability Changes How You Think
Instead of mutating data, you build transformations.
This encourages safer, cleaner designs with fewer edge cases.

### 2. Pattern Matching Is Extremely Expressive
Elixir’s pattern-matched function definitions naturally separate cases:

- Empty vs non-empty stacks
- Queues with or without front elements

This leads to more readable and maintainable code.

### 3. Persistence Comes for Free in FP
Every version of a structure remains valid, allowing:

- Safe concurrency
- Undo/redo semantics
- Simpler reasoning

### 4. Structural Sharing Avoids Memory Waste
Even though new versions are created, they share underlying lists.
This makes immutable data structures efficient.

### 5. Functional Data Structures Require Creative Solutions

The two-list queue design is not obvious in imperative programming.
It is an example of how FP often requires a different viewpoint to achieve efficiency.

## Running Tests

Tests are provided for both Stack and Queue modules. There is also one test that uses the functions created to implement a solution.

Run the tests with:

```sh
mix test
```

---

## License

This project is license-free for educational purposes. Use, modify, and share as you wish!
