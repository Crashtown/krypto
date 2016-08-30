defmodule Krypto.Application do
  use Application

  def start(_type, _args) do
    priv_dir = :code.priv_dir(:krypto)
    pubkey_name = Application.get_env(:krypto, :pubkey)
    pubkey =
      :filename.join(priv_dir, pubkey_name)
      |> extract_pubkey()
    privkey_name = Application.get_env(:krypto, :privkey)
    privkey =
      :filename.join(priv_dir, privkey_name)
      |> extract_privkey()
    Krypto.Supervisor.start_link(privkey, pubkey)
  end

  defp extract_pubkey(path) do
    {:ok, bin} = File.read(path)
    [{rsa_pub, _}] = :public_key.ssh_decode(bin, :openssh_public_key)
    rsa_pub
  end

  defp extract_privkey(path) do
    {:ok, bin} = File.read(path)
    [pem_entry] = :public_key.pem_decode(bin)
    :public_key.pem_entry_decode(pem_entry)
  end
end
