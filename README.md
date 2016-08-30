# Krypto

Assessment application.

Repo contains generated with `ssh-keygen` rsa 2048 key in `priv` dir.
At startup app will try to load keys and store it in `Krypto.Server` agent's state.
Calls to `:public_key` module performed in calling processes.
Lonely test can be started with `mix test`


### references:
* [Crypto Tutorial by Joe Armstrong](https://github.com/joearms/crypto_tutorial)
* [public_key module documentation](http://erlang.org/doc/apps/public_key/introduction.html)