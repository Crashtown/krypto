defmodule Krypto.Supervisor do
  use Supervisor

  def start_link(privkey, pubkey) do
    Supervisor.start_link(__MODULE__, [privkey, pubkey])
  end

  def init(keys) do
    children = [worker(Krypto.Server, keys)]
    supervise(children, strategy: :one_for_one)
  end
end
