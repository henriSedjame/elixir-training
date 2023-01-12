defmodule Chat.Supervisor do
  use Supervisor


  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init(_) do
    children = [
      worker(Chat.Server, [], id: :chat_server)
    ]

    supervise(children, strategy: :one_for_one)
  end
end
