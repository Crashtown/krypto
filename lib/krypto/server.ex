defmodule Krypto.Server do
  @server __MODULE__

  defstruct privkey: nil, pubkey: nil

  def start_link(privkey, pubkey) do
    Agent.start_link(fn -> %Krypto.Server{privkey: privkey, pubkey: pubkey} end,
      name: @server)
  end

  def get_pubkey do
    Agent.get(@server, fn(state) -> state.pubkey end)
  end

  def get_privkey do
    Agent.get(@server, fn(state) -> state.privkey end)
  end
end
