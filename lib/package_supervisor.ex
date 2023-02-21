defmodule PackageSupervisor do
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, [])
  end

  def init([]) do
    children = [
      {PackageReceiver, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
