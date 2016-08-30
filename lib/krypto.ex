defmodule Krypto do
  def encrypt_public(data) when is_binary(data) do
    pubkey = Krypto.Server.get_pubkey
    :public_key.encrypt_public(data, pubkey)
  end

  def decrypt_private(cipher) when is_binary(cipher) do
    privkey = Krypto.Server.get_privkey
    :public_key.decrypt_private(cipher, privkey)
  end
end
