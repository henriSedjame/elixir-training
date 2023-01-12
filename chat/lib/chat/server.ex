defmodule Chat.Server do
  @moduledoc false

  use GenServer

  @get_msg  :get_msgs
  @add_msg  :add_msg
  @server_name :chat_server
  
  # Client API

  @spec start_link() :: pid()
  def start_link() do
    GenServer.start_link(__MODULE__, [], name: @server_name)
  end

  def get_msgs, do: GenServer.call(@server_name, @get_msg)

  def add_msg(msg), do: GenServer.cast(@server_name, { @add_msg, msg })

  # Server API

  @doc """
  init function takes the inital state and returns a tuple of the form
  {:ok, state} or {:ok, state, timeout} or {:stop, reason, state}
  """
  def init(msgs) do
    {:ok, msgs}
  end

  @doc """
  handle_call is called when a SYNCHRONOUS CALL is made to the server,
  It takes the message, the pid of the caller and the state and returns
  a tuple of the form {:reply, reply, new_state} or {:reply, reply, new_state, timeout}
  """
  def handle_call(@get_msg, _from, msgs) do
    # reply with the current messages, and the new state
    {:reply, msgs, msgs}
  end

  @doc """
  handle_cast is called when an ASYNCHRONOUS CALL is made to the server,
  It takes the message, the pid of the caller and the state and returns
  a tuple of the form {:noreply, new_state} or {:noreply, new_state, timeout}
  """
  def handle_cast({@add_msg, msg}, msgs) do
    # add the message to the list of messages
    {:noreply, [msg | msgs]}
  end
end
