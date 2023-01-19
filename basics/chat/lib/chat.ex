defmodule Chat do
  @spec receive_message(String.t()) :: :ok
  def receive_message(message) do
    IO.puts message
  end

  @spec send_message(atom(), String.t()) :: :ok
  def send_message(recipient, message) do
    spawn_task(__MODULE__, :receive_message, recipient, [message])
  end


  @spec spawn_task(module(), atom(), atom(), [String.t()]) :: :ok
  def spawn_task(module, fun, recipient, args) do
    recipient
    |> remote_supervisor()
    |> Task.Supervisor.async(module, fun, args) # Task.Supervisor.async execute an action on a remote node
    |> Task.await()
  end

  def remote_supervisor(recipient) do
    Application.get_env(:chat, :remote_supervisor).(recipient)
  end
end
