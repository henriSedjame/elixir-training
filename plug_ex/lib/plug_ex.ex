defmodule PlugEx do
  use Application
  require Logger

  def start(_type, _args) do

    port = Application.get_env(:plug_ex, :server)[:port]

    children = [
      Plug.Adapters.Cowboy.child_spec(
        scheme: :http,
        plug: PlugEx.Router,
        options: [port: port]
      )
    ]

    Logger.info "Starting PlugEx"

    opts = [strategy: :one_for_one, name: PlugEx.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
