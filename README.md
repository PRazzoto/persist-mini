# PersistMini

PersistMini is a minimal Elixir library that provides immutable data structures for functional programming: a LIFO Stack and a FIFO Queue. These implementations are educational and practical, showcasing how to build and work with immutable collections in Elixir.

## Features

- **Immutable Stack** (LIFO)
  - `empty/0`: Create a new empty stack
  - `empty?/1`: Check if the stack is empty
  - `push/2`: Push a new element onto the stack
  - `pop/1`: Remove and return the top element
  - `peek/1`: View the top element without removing
  - `to_list/1`: Convert the stack to a list

- **Immutable Queue** (FIFO)
  - `empty/0`: Create a new empty queue
  - `empty?/1`: Check if the queue is empty
  - `enqueue/2`: Add an element to the rear
  - `dequeue/1`: Remove and return the front element
  - `front/1`: View the front element without removing
  - `to_list/1`: Convert the queue to a list

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

## API Documentation

- All modules and functions are documented inline with `@moduledoc` and `@doc` annotations.
- Generate HTML docs locally with [ExDoc](https://github.com/elixir-lang/ex_doc):

```sh
mix docs
```

Read the generated docs in `doc/index.html` after running the above command.

When published to Hex, docs are accessible at [HexDocs](https://hexdocs.pm/persist_mini).

## Running Tests

Tests are provided for both Stack and Queue modules.

Run the tests with:

```sh
mix test
```

---

## License

This project is license-free for educational purposes. Use, modify, and share as you wish!
