defmodule Basic do
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, "Hello")
  end

  @doc """
  Setup the initial state
  """
  def init(initial_data) do
    IO.puts("I am being called")

    greetings = %{:greeting => initial_data}

    {:ok, greetings}
  end

  def get_greeting(pid) do
    GenServer.call(pid, {:get_greeting})
  end

  def set_greeting(pid, new_greeting) do
    GenServer.call(pid, {:set_greeting, new_greeting})
  end

  def handle_call({:set_greeting, new_greeting}, _from, state) do
    new_state = Map.put(state, :greeting, new_greeting)
    {:reply, new_greeting, new_state}
  end

  def handle_call({:get_greeting}, _from, state) do
    current_greeting = Map.get(state, :greeting)
    {:reply, current_greeting, state}
  end
end
