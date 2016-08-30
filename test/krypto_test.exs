defmodule KryptoTest do
  use ExUnit.Case
  doctest Krypto

  test "encrypt data with pubkey and decrypt with privkey" do
    data = "wow such secret"
    cipher = Krypto.encrypt_public(data)
    assert data == Krypto.decrypt_private(cipher)
  end
end
