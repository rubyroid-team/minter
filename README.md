<p align="center" background="black"><img src="minter-logo.svg" width="400"></p>

# Minter

This is a Ruby SDK based on Golang SDK for working with Minter blockchain



## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minter'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install minter

## Using Minter API 

* [Minter Api](#using-minterapi)
    - Methods:
	    - [Address](#address)
	    - [Address at height](#address-at-height)
	    - [Balance](#balance)
	    - [Nonce](#nonce)
	    - [Block](#block)
	    - [Candidate](#candidate)
	    - [Candidates](#candidates)
	    - [CoinInfo](#coininfo)
	    - [EstimateCoinBuy](#estimatecoinbuy)
	    - [EstimateCoinSell](#estimatecoinsell)
	    - [EstimateTxCommission](#estimatetxcommission)
	    - [Events](#events)
	    - [MaxGas](#maxgas)
	    - [MinGasPrice](#mingasprice)
	    - [MissedBlocks](#missedblocks)
	    - [Send](#send)
	    - [Status](#status)
	    - [Validators](#validators)
	    - [Transaction](#transaction)
	    - [Transactions](#transactions)
	    - [Unconfirmed Transactions](#unconfirmed-transactions)
* [Minter SDK](#using-mintersdk)
    - [Create Transaction](#create-transaction)
    	- [Send](#send-transaction)
        - [SellCoin](#sell-coin-transaction)
        - [SellAllCoin](#sell-all-coin-transaction)
        - [BuyCoin](#buy-coin-transaction)
        - [CreateCoin](#create-coin-transaction)
        - [DeclareCandidacy](#declare-candidacy-transaction)
        - [Delegate](#delegate-transaction)
        - [SetCandidateOn](#set-candidate-online-transaction)
        - [SetCandidateOff](#set-candidate-offline-transaction)
        - [RedeemCheck](#redeem-check-transaction)
        - [Unbond](#unbond-transaction)
        - [Multisend](#multisend-transaction)
        - [EditCandidate](#edit-candidate-transaction)
        - [CreateMultisigAddress](#create-multisig-address)
	- [Sign transaction](#sign-transaction)
	  - [Single signature](#single-signature)
	  - [Multi signature](#multi-signatures)
	- [Get fee of transaction](#get-fee-of-transaction)
	- [Get hash of transaction](#get-hash-of-transaction)
	- [Decode Transaction](#decode-transaction)
	- [Minter Deep Links](#minter-deep-links)
	- [Minter Check](#minter-check)
	- [Minter Wallet](#minter-wallet)
	    - [Create wallet](#create-wallet)		
	- [Minter Key](#minter-key)
	    - [Generate mnemonic](#generate-mnemonic)
	    - [Get private key from mnemonic](#get-private-key-from-mnemonic)
	    - [Get public key from private key](#get-public-key-from-private-key)
	    - [Get Minter address from public key](#get-minter-address-from-public-key)
	    - [Get Minter address from private key](#get-minter-address-from-private-key)
	    - [Get Minter address from mnemonic](#get-minter-address-from-mnemonic)
* [Tests](#tests)


### Minter API
You can get all valid responses and full documentation at [Minter Node Api](https://docs.minter.network)

Create Minter::Api client

```ruby
require "minter"

client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"
```

### Address

Returns coins list, balance and transaction count (for nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
response = client.address(address: address)
response.status
#=> 200
response.body
#=> {"jsonrpc"=>"2.0", "id"=>"", "result"=>{"balance"=>{"DEVDEV"=>"1000000000000002000", "DEVTWO"=>"1000000000000000000", "MNT"=>"66565140000000800001000"}, "transaction_count"=>"31"}}
````

### Address at height

Returns coins list, balance and transaction count (for nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
response = client.address(address: address, height: 1)
response.status
#=> 200
response.body
#=> {"jsonrpc"=>"2.0", "id"=>"", "result"=>{"balance"=>{"MNT"=>"0"}, "transaction_count"=>"0"}}

````

### Balance

Returns coins list, balance and transaction count (for nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
response = client.balance(address: address)
response.status
#=> 200
response.body
#=> {"jsonrpc"=>"2.0", "id"=>"", "result"=>{"balance"=>{"DEVDEV"=>"1000000000000002000", "DEVTWO"=>"1000000000000000000", "MNT"=>"66565140000000800001000"}, "transaction_count"=>"31"}}
````



### Nonce

Returns next transaction number (nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
nonce = client.nonce(address: address)
#=> 28
```

### Block

Returns block data at given height.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.block(height: 1)
response.status
#=> 200
response.body
#=> {"jsonrpc"=>"2.0",
#  "id"=>"",
#  "result"=>
#   {"hash"=>"499a3ba23ec8a046eb7d1eecdf4123b795e2ba3df0e57122f75fa656144553ea",
#    "height"=>"1",
#    "time"=>"2020-04-08T13:00:00Z",
#    "num_txs"=>"0",
#    "transactions"=>[],
#    "block_reward"=>"331000000000000000000",
#    "size"=>"280"}}

```

### Candidate

Returns candidate’s info by provided public_key. It will respond with 404 code if candidate is not found.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

public_key = "Mp4d2900d19ee3ce815bdb38daa3bc8d15c2bbe4945c3cdfac80df3ae6da31464b"
response = client.candidate(public_key: public_key)
response.status
#=> 200
response.body
#=> {"jsonrpc"=>"2.0",
#  "id"=>"",
#  "result"=>
#   {"reward_address"=>"Mx251cb0043a0240779103aa7c210f638f887699f8",
#    "owner_address"=>"Mx251cb0043a0240779103aa7c210f638f887699f8",
#    "total_stake"=>"4950000000000000000",
#    "pub_key"=>"Mp4d2900d19ee3ce815bdb38daa3bc8d15c2bbe4945c3cdfac80df3ae6da31464b",
#    "commission"=>"10",
#    "stakes"=>[{"owner"=>"Mx251cb0043a0240779103aa7c210f638f887699f8", "coin"=>"MNT", "value"=>"4950000000000000000", "bip_value"=>"4950000000000000000"}],
#    "status"=>1}}
```
### Candidates

Returns list of candidates.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.candidates
response.status
#=> 200
response.body
#=> {"jsonrpc"=>"2.0",
#    "id"=>"",
#    "result"=>
#     [
#      {"reward_address"=>"Mx9816046484c7c50fc43d5a564cadb494910a27b7",
#       "owner_address"=>"Mx9816046484c7c50fc43d5a564cadb494910a27b7",
#       "total_stake"=>"100019333250000000000000",
#       "pub_key"=>"Mpf17328239cd81453b9e9393f66137e5442fb108c7b4fc36b6acfd838f7e6e0c4",
#       "commission"=>"85",
#       "status"=>2},
#      {"reward_address"=>"Mx69ebd94f75444b22953c7a439f7ccef6d9e9be5a",
#      "owner_address"=>"Mx3b3af9a8520910b29735ca44a64f52f09f057d64",
#      "total_stake"=>"49500000000000000000",
#      "pub_key"=>"Mpab7a9b763569a45b3221d4276e72466c225524354eee6c7d2e12858ac0eef864",
#      "commission"=>"1",
#      "status"=>1}
#      ]
```

### CoinInfo

Returns information about coin.
Note: this method does not return information about base coins (MNT and BIP).

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.coin_info("CAPITAL")
response.status
#=> 200
response.body
#=> {"jsonrpc"=>"2.0",
#  "id"=>"",
#  "result"=>
#   {"name"=>"CAPITAL",
#    "symbol"=>"CAPITAL",
#    "volume"=>"10004406818749673124164086",
#    "crr"=>"80",
#    "reserve_balance"=>"100055088268419724781795",
#    "max_supply"=>"1000000000000000000000000000000000"}}
```

### EstimateCoinBuy

Return estimate of buy coin transaction.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.estimate_coin_buy(coinToSell: "BIP", valueToBuy: 1, coinToBuy: "MNT")
response.status
#=> 200
```

### EstimateCoinSell

Return estimate of sell coin transaction.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.estimate_coin_sell(coinToSell: "BIP", valueToSell: 1, coinToBuy: "MNT")
response.status
#=> 200
```
### EstimateTxCommission

Return estimate of transaction.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.estimate_tx_comission(transaction: "0xf88522020a8a4d4e540000000000000001abea8a4d4e540000000000000094e7812ab98ac5ac37e2ab20da3136ad91bb22d49789014d1120d7b1600000808001b845f8431ba07424d88d612132c847c1c92c1f471471fa8034914260223cb547f097e2bd7587a0201fa4d869ba564538996a71e6aa1e2b069d746b8fa0a563e023989986ae91a7")
```

### Events

Returns events at given height.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.events(height: 1)
```


### MaxGas

Returns current max gas.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.max_gas
response.status
#=>200
response.body
#=> {"jsonrpc"=>"2.0", "id"=>"", "result"=>"100000"}
```

### MinGasPrice

Returns current min gas price.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.min_gas_price
response.status
#=>200
response.body
#=> {"jsonrpc"=>"2.0", "id"=>"", "result"=>"1"}

```

### MissedBlocks

Returns missed blocks by validator public key.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.missed_block(public_key: public_key)
```

### Send 

Returns the result of sending __signed__ tx.

```ruby
signed_transaction = transaction.sign(privateKey)
response = signed_transaction.send
# or 
response = client.send_transaction(transaction: signed_transaction.tx_hash)
response.status 
#=> 200
response.body
#=>
{"jsonrpc"=>"2.0", "id"=>"", "result"=>{"code"=>0, "data"=>"", "log"=>"", "hash"=>"9219C1FA06D72C2A4ACDFB4D20F52E3F536C6134E20F485F1E2EA6D71C0DFA20"}} 
```

### Status

Returns node status info.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.status
response.status
#=>200
response.body
#=>
 {"jsonrpc"=>"2.0",
   "id"=>"",
   "result"=>
    {"version"=>"1.1.6-testnet",
     "latest_block_hash"=>"E20E0B26DAB8CEE5AC1CB46B5184C63565522978EDF153DA3017C7D34F2D3F30",
     "latest_app_hash"=>"995C21A980D4E0A7649E56252CB4E279A5820655B717A017FC09FE2E9D841554",
     "latest_block_height"=>"702448",
     "latest_block_time"=>"2020-05-12T20:59:23.252868652Z",
     "keep_last_states"=>"120",
     "tm_status"=>
      {"node_info"=>
        {"protocol_version"=>{"p2p"=>"7", "block"=>"10", "app"=>"6"},
         "id"=>"4735e67924e611b89fbd3f951441b5e912e226d3",
         "listen_addr"=>"tcp://0.0.0.0:26656",
         "network"=>"minter-testnet-08-04",
         "version"=>"0.33.2",
         "channels"=>"4020212223303800",
         "moniker"=>"minter-node-1.testnet.minter.network",
         "other"=>{"tx_index"=>"on", "rpc_address"=>"tcp://127.0.0.1:26657"}},
       "sync_info"=>
        {"latest_block_hash"=>"E20E0B26DAB8CEE5AC1CB46B5184C63565522978EDF153DA3017C7D34F2D3F30",
         "latest_app_hash"=>"995C21A980D4E0A7649E56252CB4E279A5820655B717A017FC09FE2E9D841554",
         "latest_block_height"=>"702448",
         "latest_block_time"=>"2020-05-12T20:59:23.252868652Z",
         "catching_up"=>false},
       "validator_info"=>
        {"address"=>"43253BE55C58BCA3045BEFABEF873944B56E3555", "pub_key"=>{"type"=>"tendermint/PubKeyEd25519", "value"=>"DSmoPlRlOh1fNOVh4BNfHoHLyuFS8fMnqzaFen4y3kw="}, "voting_power"=>"98784385"}}}}

```

### Transaction

Returns transaction info.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

transaction_hash = "Mt56c1957d15bf4143f7cd180f837bce51564a054cfbdaf5c5e179f9b0aad8e8b2"

response = client.transaction_info(transaction_hash: transaction_hash)
response.status
#=>200
response.body
#=>
 {"jsonrpc"=>"2.0",
 "id"=>"",
 "result"=>
  {"hash"=>"56C1957D15BF4143F7CD180F837BCE51564A054CFBDAF5C5E179F9B0AAD8E8B2",
   "raw_tx"=>
    "f88522020a8a4d4e540000000000000001abea8a4d4e540000000000000094e7812ab98ac5ac37e2ab20da3136ad91bb22d49789014d1120d7b1600000808001b845f8431ba07424d88d612132c847c1c92c1f471471fa8034914260223cb547f097e2bd7587a0201fa4d869ba564538996a71e6aa1e2b069d746b8fa0a563e023989986ae91a7",
   "height"=>"701284",
   "index"=>0,
   "from"=>"Mx251cb0043a0240779103aa7c210f638f887699f8",
   "nonce"=>"34",
   "gas"=>"10",
   "gas_price"=>10,
   "gas_coin"=>"MNT",
   "type"=>1,
   "data"=>{"coin"=>"MNT", "to"=>"Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497", "value"=>"24000000000000000000"},
   "payload"=>"",
   "tags"=>{"tx.type"=>"01", "tx.from"=>"251cb0043a0240779103aa7c210f638f887699f8", "tx.to"=>"e7812ab98ac5ac37e2ab20da3136ad91bb22d497", "tx.coin"=>"MNT"}}}
```

### Transactions

Return transactions by query.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

query = "tags.tx.coin='MNT'" 
page = 1
per_page = 1
response = client.transactions(query: query, per_page: per_page, page: page)
response.status
#=> 200
response.body
#=> 
{"jsonrpc"=>"2.0",
 "id"=>"",
 "result"=>
  [{"hash"=>"9398DB947BC1397212C3F7FBE3D4131E68DDD1CA5AD36860DF5D7700E1C279EB",
    "raw_tx"=>
     "f87e82229102018a4d4e540000000000000001a2e18a4d4e540000000000000094a1f103c242237370d409ff5ff9f1817d42f94dda80808001b845f8431ba0a377be8dcab2a0cd005a8b392876724ed97aea4c312dc1081f581384ec938a1da01851f86f174c6d104ebb61cdab4e38056641147777e12e1184d8140c2b85d080",
    "height"=>"702308",
    "index"=>0,
    "from"=>"Mxa1f103c242237370d409ff5ff9f1817d42f94dda",
    "nonce"=>"8849",
    "gas"=>"10",
    "gas_price"=>1,
    "gas_coin"=>"MNT",
    "type"=>1,
    "data"=>{"coin"=>"MNT", "to"=>"Mxa1f103c242237370d409ff5ff9f1817d42f94dda", "value"=>"0"},
    "payload"=>"",
    "tags"=>{"tx.type"=>"01", "tx.from"=>"a1f103c242237370d409ff5ff9f1817d42f94dda", "tx.to"=>"a1f103c242237370d409ff5ff9f1817d42f94dda", "tx.coin"=>"MNT"}}]}

```

### Unconfirmed Transactions

Returns unconfirmed transactions.


```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

query = "tags.tx.coin='MNT'" 
page = 1
per_page = 1
response = client.unconfirmed_transactions
response.status
#=> 200
response.body
#=>
{"jsonrpc"=>"2.0", "id"=>"", "result"=>{"n_txs"=>"0", "total"=>"0", "total_bytes"=>"0", "txs"=>[]}}
```

### Validators

Returns list of active validators.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://minter-node-1.testnet.minter.network:8841"

response = client.validators
response.status
#=>200
response.body
#=>
{"jsonrpc"=>"2.0",
 "id"=>"",
 "result"=>
  [{"pub_key"=>"Mp0d29a83e54653a1d5f34e561e0135f1e81cbcae152f1f327ab36857a7e32de4c", "voting_power"=>"99121402"},
   {"pub_key"=>"Mpa3c16ffc2af26f199dd23c52932ce22441f848aa3ab2b7015de01e2f9c293464", "voting_power"=>"49661"},
   {"pub_key"=>"Mpf17328239cd81453b9e9393f66137e5442fb108c7b4fc36b6acfd838f7e6e0c4", "voting_power"=>"9911"},
   {"pub_key"=>"Mp14c93843ca40a62b9e7d02a824e7ffe83b49e3329ae963afdd7e500071ab9bfc", "voting_power"=>"819024"}]}


```

## Using Minter SDK

### Sign transaction

Returns a signed tx.

#### Single signature

```ruby
transaction = Minter::SendCoinTx.new(
  address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
  value: 24_000_000_000_000_000_000,
  coin: "MNT",
  nonce: 1,
  chain_id: 2,
  gas_coin: "MNT",
  gas_price: 10
)

signed_tx = transaction.sign(private_key)
signed_tx.tx_hash
#=> "0xf88501020a8a4d4e540000000000000001abea8a4d4e540000000000000094e7812ab98ac5ac37e2ab20da3136ad91bb22d49789014d1120d7b1600000808001b845f8431ba07fde3c0e8d9ffb5fd7025099c9f3672deffab0b784787f5d45ea8f27b0ffe989a02f7cd63ac0d75e559f540d8b33464b11da4605e623d62a5b2ddce5adf70c35cb" 
```

#### Multi signatures
```ruby
multisig_address = "Mxeda4bb5456f5eb8a19f57c8c6ec844d05feae879"
private_key1 = "4de029ca7b95c163f88c66e6351f2a986a48834b4681ec1e43eed5d120227103"
private_key2 = "49e48cd0f81e7aabfc840301c66f00318f50b25c79664c3f337d7ad4f919638e"
transaction = Minter::SendCoinTx.new(
    address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
    value: 4_000_000_000_000_000_000,
    coin: "MNT",
    nonce: 2,
    chain_id: 2,
    gas_coin: "MNT",
    gas_price: 10
)
signed_tx = transaction.multisign(multisig_address, private_key1, private_key2)
#=> #<Minter::SignedTx:0x00007fe340120090
# @transaction=
#  #<Minter::SendCoinTx:0x00007fe3411da908 @address_to="Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497", @chain_id=2, @coin="MNT", @gas_coin="MNT", @gas_price=10, @nonce=2, @value=4000000000000000000>,
# @tx_hash=
#  "0xf8e202020a8a4d4e540000000000000001aae98a4d4e540000000000000094e7812ab98ac5ac37e2ab20da3136ad91bb22d497883782dace9d900000808002b8a3f8a194eda4bb5456f5eb8a19f57c8c6ec844d05feae879f88af8431ba0287dd3956acae624abc25e6ba60018f60a80e144f5678ceb35c35613fcd363bfa01886706c7ffa0e6ccfc7c3dda186d3e8beea5214c30502ad9a24d8a29ced685af8431ba0302a560b420ed0da95f4f8425ac605a2462d35449e44557f152c4308845e1710a04cd1b834752e3a26b0fd543a20e3ef99ca233b049e064146c6a8cdf19d895552">
```

### Create transaction

#### Send transaction

Transaction for sending arbitrary coin.

coin - Symbol of a coin.
address_to - Recipient address in Minter Network.
value - Amount of Coin to send.

##### Example

```ruby
Minter::SendCoinTx.new(
      address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
      value: 24_000_000_000_000_000_000,
      coin: "MNT",
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 10
    )
```

#### Sell coin transaction

Transaction for selling one coin (owned by sender) in favour of another coin in a system.

coin_to_sell - Symbol of a coin to give.
value_to_sell - Amount of CoinToSell to give.
coin_to_buy - Symbol of a coin to get.
minimum_value_to_buy - Minimum value of coins to get.

##### Example

```ruby
Minter::SellCoinTx.new(
      coin_to_sell: "MNT",
      value_to_sell: 1_000_000_000_000_000_000,
      coin_to_buy: "TEST",
      minimum_value_to_buy: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Sell all coin transaction

Transaction for selling one coin (owned by sender) in favour of another coin in a system.

coin_to_sell - Symbol of a coin to give.
coin_to_buy - Symbol of a coin to get.
minimum_value_to_buy - Minimum value of coins to get.

##### Example

```ruby
Minter::SellAllCoinTx.new(
      coin_to_sell: "MNT",
      coin_to_buy: "TEST",
      minimum_value_to_buy: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Buy coin transaction

Transaction for buy a coin paying another coin (owned by sender).

coin_to_buy - Symbol of a coin to get.
value_to_buy - Amount of CoinToBuy to get.
coin_to_sell - Symbol of a coin to give.
maximum_value_to_sell - Maximum value of coins to sell.

##### Example

```ruby
transaction = Minter::BuyCoinTx.new(
      coin_to_buy: "TEST",
      value_to_buy: 1_000_000_000_000_000_000,
      coin_to_sell: "MNT",
      maximum_value_to_sell: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Create coin transaction

Transaction for creating new coin in a system.

name - Name of a coin. Arbitrary string up to 64 letters length.
symbol - Symbol of a coin. Must be unique, alphabetic, uppercase, 3 to 10 symbols length.
initial_amount - Amount of coins to issue. Issued coins will be available to sender account.
initial_reserve - Initial reserve in BIP's. ConstantReserveRatio - CRR, uint, should be from 10 to 100.

##### Example

```ruby
Minter::CreateCoinTx.new(
      name: "SUPER TEST",
      symbol: "SPRTEST",
      initial_amount: 100_000_000_000_000_000_000,
      initial_reserve: 10_000_000_000_000_000_000,
      reserve_ratio: 10,
      max_supply: 1_000_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Declare candidacy transaction

Transaction for declaring new validator candidacy.

address - Address of candidate in Minter Network. This address would be able to control candidate. Also all rewards will be sent to this address.
pubkey - Public key of a validator.
commission - Commission (from 0 to 100) from rewards which delegators will pay to validator.
coin - Symbol of coin to stake. Stake - Amount of coins to stake.

##### Example

```ruby
Minter::DeclareCandidacyTx.new(
      address: "Mx9f7fd953c2c69044b901426831ed03ee0bd0597a",
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      commission: 10,
      coin: "MNT",
      stake: 5_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Delegate transaction

Transaction for delegating funds to validator.

pubkey - Public key of a validator.
coin - Symbol of coin to stake.
value - Amount of coins to stake.

##### Example

```ruby
Minter::DelegateTx.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      coin: "MNT",
      value: 10_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Unbond transaction

Transaction for unbonding funds from validator's stake.

pubkey - Public key of a validator.
coin - Symbol of coin to stake.
value - Amount of coins to stake.

##### Example

```ruby
Minter::UnbondTx.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      coin: "MNT",
      value: 10_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Redeem check transaction

Transaction for redeeming a check.

RawCheck - Raw check received from sender. Proof - Proof of owning a check.

Note that maximum GasPrice is limited to 1 to prevent fraud, because GasPrice is set by redeem tx sender but commission is charded from check issuer.

##### Example

```ruby
Minter::RedeemCheckTx.new(
      check: check,
      proof: proof,
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Set candidate online transaction

Transaction for turning candidate on. This transaction should be sent from address which is set in the "Declare candidacy transaction".

PubKey - Public key of a validator.

##### Example

```ruby
Minter::SetCandidateOnTx.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Set candidate offline transaction

Transaction for turning candidate off. This transaction should be sent from address which is set in the "Declare candidacy transaction".

PubKey - Public key of a validator.

##### Example

```ruby
Minter::SetCandidateOffTx.new(
      pubkey: "Mp0eb98ea04ae466d8d38f490db3c99b3996a90e24243952ce9822c6dc1e2c1a43",
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Edit candidate transaction

Transaction for editing existing candidate.

##### Example
```ruby
Minter::EditCandidateTx.new(
      pubkey: "Mp4ae1ee73e6136c85b0ca933a9a1347758a334885f10b3238398a67ac2eb153b8",
      reward_address: "Mx89e5dc185e6bab772ac8e00cf3fb3f4cb0931c47",
      owner_address: "Mxe731fcddd37bb6e72286597d22516c8ba3ddffa0",
      nonce: 1,
      chain_id: 2,
      gas_coin: "MNT",
      gas_price: 1
    )
```

#### Create multisig address

Transaction for creating multisignature address.

```ruby
address1 = "Mx08d920c5d93dbf23038fe1a54bbb34f41f77677c" 
address2 = "Mx9c7f68ff71b5819c41e8f87cc99bdf6359da3d75" 
address3 = "Mx9c7f68ff71b5819c41e8f87cc99bdf6359da3d75" 
private_key =  "ae089b32e4e0976ca6888cb1023148bd1a9f1cc28c5d442e52e586754ff48d63"

transaction = Minter::CreateMultisigAddressTx.new(
    threshold: 7,
    nonce: 11,
    chain_id: 2,
    gas_coin: "MNT",
    gas_price: 1
)

transaction.add_address(address: address1, weight: 1)
transaction.add_address(address: address2, weight: 3)
transaction.add_address(address: address3, weight: 5)

transaction.multisig_address
=> "Mxc0edeaee8750330d01bcefcbd34198b2ef7b1167"
```
#### Multisend transaction

Transaction for sending coins to multiple addresses.

```ruby
transaction = Minter::MultiSendTx.new(
  nonce: 1,
  chain_id: 2,
  gas_coin: "MNT",
  gas_price: 1
)
    
transaction.add_item(
  symbol: "MNT",
  address_to: "Mxfe60014a6e9ac91618f5d1cab3fd58cded61ee99",
  value: 100_000_000_000_000_000
)
    
transaction.add_item(
  symbol: "MNT",
  address_to: "Mxddab6281766ad86497741ff91b6b48fe85012e3c",
  value: 200_000_000_000_000_000
)
```
### Get fee of transaction
```ruby
transaction = Minter::SendCoinTx.new(
  address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
  value: 24_000_000_000_000_000_000,
  coin: "MNT",
  nonce: 65,
  chain_id: 2,
  gas_coin: "MNT",
  gas_price: 10
)

transaction.fee
#=> ""

```
### Decode Transaction

```ruby
# IN PROGRESS
```
### Minter Deep Links

```ruby
# IN PROGRESS
```
More info about [Minter Link Protocol](https://github.com/MinterTeam/minter-link-protocol)

### Minter Check

Minter Check is like an ordinary bank check. Each user of network can issue check with any amount of coins and pass it to another person. Receiver will be able to cash a check from arbitrary account.

* Create Issue Check. Nonce - unique "id" of the check. Coin Symbol - symbol of coin. Value - amount of coins. Due Block - defines last block height in which the check can be used.

```ruby
# IN PROGRESS
```

* Sign Issue Check

```ruby
# IN PROGRESS
```

* Prepare check string and convert to data

```ruby
# IN PROGRESS
``` 

* Proof check

```ruby
# IN PROGRESS
```

### Minter Wallet

#### Create wallet
* This method returns generated seed, private key, public key, mnemonic and Minter address.

```ruby
wallet = Minter::Wallet.new
# => #<Minter::Wallet:0x00007fa168c31f48
#  @address="Mx02b065d31b57511279f5b4d6ddb4c35a5ab0ebff",
#  @mnemonic=
#   "you random jacket limit ship vacuum mango various penalty imitate swallow second",
#  @private_key=
#   "7ced83b93186ff8d4c20f6b8b6f4a610eafd64d12024105f68796120dd3e7bce",
#  @public_key=
#   "Mp961589ae817659c6bb323587faa9a92a91b5e8481dd3b73ad0dc680464dac5adbc2d498064598bc36e158436fb1861245ef909a1776e5cb50221db718c82a483">
```

#### Build wallet from mnemonic
```ruby
mnemonic = "hurt orient quarter item can into zebra west either ship team pattern"
wallet = Minter::Wallet.new(mnemonic) 
=> #<Minter::Wallet:0x00007fb7019cdaf0
@address="Mx3f865a277ef9e901280d0e607294be9a654860ea",
@mnemonic="hurt orient quarter item can into zebra west either ship team pattern",
@private_key="0ce363580a20351d995dbafc8942f61c0094f38d0d4f837d1f0c37a9f3c3c7ca",
@public_key="Mp7084eec27577ffd4151b54bf7d8ed500a514629fea4e5992bb94a704011d89225be0543fd0a27069b7855c0d260aa21011380843d03d18aabc2bb1e4d4c80e15">
```

### Minter Key
#### Generate mnemonic.

```ruby
mnemonic = Minter::Key.new_mnemonic
#=> "rice joy gift diamond wisdom scout junk keen math page firm regular"
```

#### Get private key from mnemonic.

```ruby
private_key = Minter::Key.private_key_from_mnemonic(mnemonic)
# => "4f9706c0fa8f63a9481379579b4e6ab2d1e41ae8adab0885f58dc6a4859451be"
```

#### Get public key from private key.

```ruby
public_key = Minter::Key.public_key_from_private_key(private_key)
#=> "Mp4357760042c69a3414b9f66236e0cf0cc583c2bb49dff7c3cf68968df1e131bfa54483d0da3291dcba8980cf86ebe8c4d38186efe7322d5d7a3d5501149e6fb0"
```

#### Get Minter address from public key.

```ruby
address  = Minter::Key.address_from_public_key(public_key)
#=> "Mx703323dfeabdffc976c62fb156c58ea41606831e"
```

#### Get Minter address from private key.
```ruby
address  = Minter::Key.address_from_private_key(private_key)
#=> "Mx703323dfeabdffc976c62fb156c58ea41606831e"
```
#### Get Minter address from mnemonic.
```ruby
address  = Minter::Key.address_from_mnemonic(mnemonic)
#=> "Mx703323dfeabdffc976c62fb156c58ea41606831e"
```

## Tests

To run tests: 

```shell script
bundle install
rpsec
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/minter-ruby-sdk. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/minter-ruby-sdk/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Minter::Ruby::Sdk project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/minter-ruby-sdk/blob/master/CODE_OF_CONDUCT.md).
