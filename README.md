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
client.node_url = "https://node-api.testnet.minter.network/v2"
```

### Address

Returns coins list, balance and transaction count (for nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
response = client.address(address: address)
response.status
#=> 200
response.body
#=> {"balance"=>[{"coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"29999857000000000000000", "bip_value"=>"29999857000000000000000"}], "delegated"=>[], "total"=>[], "transaction_count"=>"13", "bip_value"=>"29999857000000000000000"}
````

### Address at height

Returns coins list, balance and transaction count (for nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
response = client.address(address: address, height: 1)
response.status
#=> 200
response.body
#=> {"balance"=>[], "delegated"=>[], "total"=>[], "transaction_count"=>"0", "bip_value"=>"0"} 

````

### Balance

Returns coins list, balance and transaction count (for nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
response = client.balance(address: address)
response.status
#=> 200
response.body
#=> {"balance"=>[{"coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"29999857000000000000000", "bip_value"=>"29999857000000000000000"}], "delegated"=>[], "total"=>[], "transaction_count"=>"13", "bip_value"=>"29999857000000000000000"} 
````



### Nonce

Returns next transaction number (nonce) of an address.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

address = "Mx251cb0043a0240779103aa7c210f638f887699f8"
nonce = client.nonce(address: address)
#=> 14
```

### Block

Returns block data at given height.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.block(height: 1)
response.status
#=> 200
response.body
#=> {"hash"=>"8e2534065f3fb281b3834ae79383cd75cb06245b33bd96a0d87370340039f7bc", "height"=>"1", "time"=>"1970-01-01T00:00:00Z", "transaction_count"=>"0", "transactions"=>[], "block_reward"=>"333000000000000000000", "size"=>"270", "proposer"=>"Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5", "validators"=>[{"public_key"=>"Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5", "signed"=>false}], "evidence"=>{"evidence"=>[]}, "missed"=>[]} 


```

### Candidate

Returns candidate’s info by provided public_key. It will respond with 404 code if candidate is not found.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

public_key = "Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5"
response = client.candidate(public_key: public_key)
response.status
#=> 200
response.body
#=> {"reward_address"=>"Mxa83d8ebbe688b853775a698683b77afa305a661e", "owner_address"=>"Mxa83d8ebbe688b853775a698683b77afa305a661e", "control_address"=>"Mxa83d8ebbe688b853775a698683b77afa305a661e", "total_stake"=>"2444011225306401876946221", "public_key"=>"Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5", "commission"=>"5", "used_slots"=>"10", "uniq_users"=>"6", "min_stake"=>"0", "stakes"=>[{"owner"=>"Mxa83d8ebbe688b853775a698683b77afa305a661e", "coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"1000000000000000000000000", "bip_value"=>"1000000000000000000000000"}, {"owner"=>"Mx69ebd94f75444b22953c7a439f7ccef6d9e9be5a", "coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"10000000000000000000", "bip_value"=>"10000000000000000000"}, {"owner"=>"Mx3e3b5d6087f58f2592623a62da9618a2ee020d2d", "coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"824272819147233530716891", "bip_value"=>"824272819147233530716891"}, {"owner"=>"Mxeb92ae39b84012968f63b2dd260a94d791fe79bd", "coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"609007403767000000000000", "bip_value"=>"609007403767000000000000"}, {"owner"=>"Mxeb92ae39b84012968f63b2dd260a94d791fe79bd", "coin"=>{"id"=>"5", "symbol"=>"SMALCOIN-1"}, "value"=>"27704575686000000000000", "bip_value"=>"163214040105490477218"}, {"owner"=>"Mxeb92ae39b84012968f63b2dd260a94d791fe79bd", "coin"=>{"id"=>"6", "symbol"=>"SMALCOIN"}, "value"=>"23500946264000000000000", "bip_value"=>"5258446493070597814637"}, {"owner"=>"Mxeb92ae39b84012968f63b2dd260a94d791fe79bd", "coin"=>{"id"=>"1", "symbol"=>"CUSTOM"}, "value"=>"7648158824000000000000", "bip_value"=>"1530873792242471521"}, {"owner"=>"Mxeb92ae39b84012968f63b2dd260a94d791fe79bd", "coin"=>{"id"=>"4", "symbol"=>"BIGCOIN"}, "value"=>"22993066314000000000000", "bip_value"=>"5286810985200015465954"}, {"owner"=>"Mxeeda61bbe9929bf883af6b22f5796e4b92563ba4", "coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"5000000000000000000", "bip_value"=>"5000000000000000000"}, {"owner"=>"Mx0004ae43810ac75200a0c681487d1748a4f1e0b3", "coin"=>{"id"=>"0", "symbol"=>"MNT"}, "value"=>"6000000000000000000", "bip_value"=>"6000000000000000000"}], "status"=>"2"} 
```
### Candidates

Returns list of candidates.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.candidates
response.status
#=> 200
response.body
{
	"candidates" => [{
		"reward_address" => "Mxa83d8ebbe688b853775a698683b77afa305a661e",
		"owner_address" => "Mxa83d8ebbe688b853775a698683b77afa305a661e",
		"control_address" => "Mxa83d8ebbe688b853775a698683b77afa305a661e",
		"total_stake" => "1000000000000000000000000",
		"public_key" => "Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5",
		"commission" => "5",
		"used_slots" => nil,
		"uniq_users" => nil,
		"min_stake" => nil,
		"stakes" => [],
		"status" => "2"
	}]
}
```

### CoinInfo

Returns information about coin.
Note: this method does not return information about base coins (MNT and BIP).

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

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
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.estimate_coin_buy(coinToSell: "BIP", valueToBuy: 1, coinToBuy: "MNT")
response.status
#=> 200
```

### EstimateCoinSell

Return estimate of sell coin transaction.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.estimate_coin_sell(coinToSell: "BIP", valueToSell: 1, coinToBuy: "MNT")
response.status
#=> 200
```
### EstimateTxCommission

Return estimate of transaction.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.estimate_tx_comission(transaction: "0xf88522020a8a4d4e540000000000000001abea8a4d4e540000000000000094e7812ab98ac5ac37e2ab20da3136ad91bb22d49789014d1120d7b1600000808001b845f8431ba07424d88d612132c847c1c92c1f471471fa8034914260223cb547f097e2bd7587a0201fa4d869ba564538996a71e6aa1e2b069d746b8fa0a563e023989986ae91a7")
```

### Events

Returns events at given height.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.events(height: 1)
```


### MaxGas

Returns current max gas.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.max_gas
response.status
#=>200
response.body
#=> {"max_gas_price"=>"100000"}
```

### MinGasPrice

Returns current min gas price.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.min_gas_price
response.status
#=>200
response.body
#=> {"min_gas_price"=>"1"}

```

### MissedBlocks

Returns missed blocks by validator public key.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

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
{"code"=>"0", "log"=>"", "hash"=>"Mt0cfac66950c621db243fcdd68530b455f2c579dda7a7c602822355a80e9815d2"}  
```

### Status

Returns node status info.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.status
response.status
#=>200
response.body
#=>
 {
   "version" => "1.2.0-a7c02e42-testnet",
   "network" => "minter-1-2-testnet",
   "latest_block_hash" => "553F412E3BDD05932F96AFC79C750ACCB6C6D65D253D627A9D8A88D5C893CD1A",
   "latest_app_hash" => "4337152D2F002F604CF338C29BC4AA1AF1729A93228E074153FDFF722CE33324",
   "latest_block_height" => "281797",
   "latest_block_time" => "2020-11-05T06:05:39.586760081Z",
   "keep_last_states" => "1000000",
   "total_slashed" => "433000000000000015854",
   "catching_up" => false,
   "public_key" => "Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5",
   "node_id" => "95fa41d84670bc98691101406d62aed9d64459f4"
 }

```

### Transaction

Returns transaction info.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

transaction_hash = "Mt0cfac66950c621db243fcdd68530b455f2c579dda7a7c602822355a80e9815d2"

response = client.transaction_info(transaction_hash: transaction_hash)
response.status
#=>200
response.body
#=>
 {
   "hash" => "Mt0cfac66950c621db243fcdd68530b455f2c579dda7a7c602822355a80e9815d2", "raw_tx" => "f86f0e020180019fde8094eeee1973381ab793719fff497b9a516719fcd5a287038d7ea4c68000808001b845f8431ba0b4f6ef634625c12a7cb08ca568dca87fec2ca696bde99f2669c4e297748ce7a2a00ba8fab69667b0d849054ac8d21c3194f1dfcfca01ddafacd19d0e7f708933bd", "height" => "281792", "index" => "0", "from" => "Mx251cb0043a0240779103aa7c210f638f887699f8", "nonce" => "14", "gas" => "10", "gas_price" => "1", "gas_coin" => {
     "id" => "0", "symbol" => "MNT"
   },
   "type" => "1", "data" => {
     "@type" => "type.googleapis.com/api_pb.SendData", "coin" => {
       "id" => "0", "symbol" => "MNT"
     }, "to" => "Mxeeee1973381ab793719fff497b9a516719fcd5a2", "value" => "1000000000000000"
   },
   "payload" => nil, "tags" => {
     "tx.coin_id" => "0", "tx.from" => "251cb0043a0240779103aa7c210f638f887699f8", "tx.to" => "eeee1973381ab793719fff497b9a516719fcd5a2", "tx.type" => "01"
   },
   "code" => "0",
   "log" => ""
 }
```

### Transactions

Return transactions by query.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

query = "tags.tx.coin='0'" 
page = 1
per_page = 1
response = client.transactions(query: query, per_page: per_page, page: page)
response.status
#=> 200
```

### Unconfirmed Transactions

Returns unconfirmed transactions.


```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

query = "tags.tx.coin='MNT'" 
page = 1
per_page = 1
response = client.unconfirmed_transactions
response.status
#=> 200
```

### Validators

Returns list of active validators.

```ruby
client = Minter::Api::Client.new
client.node_url = "https://node-api.testnet.minter.network/v2"

response = client.validators
response.status
#=>200
response.body
#=>
{"validators"=>[{"public_key"=>"Mpd83e627510eea6aefa46d9914b0715dabf4a561ced78d34267b31d41d5f700b5", "voting_power"=>"100000000"}]} 

```

## Using Minter SDK

### Sign transaction

Returns a signed tx.

#### Single signature

```ruby
mnemonic = "oppose gym crucial devote skin robust exile antique split clean bright move"
sender_address = Minter::Key.address_from_mnemonic(mnemonic)
sender_private_key = Minter::Key.private_key_from_mnemonic(mnemonic)
nonce = client.nonce(address: sender_address)

receiver_address = "Mxeeee1973381ab793719fff497b9a516719fcd5a2"

transaction = Minter::SendCoinTx.new(
    address_to: receiver_address,
    value: 1_000_000_000_000_000,
    coin: 0,
    nonce: nonce,
    chain_id: 2,
    gas_coin: 0,
    gas_price: 1
)

signed_tx = transaction.sign(sender_private_key)
signed_tx.tx_hash
#=> "0xf86f0f020180019fde8094eeee1973381ab793719fff497b9a516719fcd5a287038d7ea4c68000808001b845f8431ca029870ea74e51ca5f89749860875ce69d7afd8b9bff6debebf127d14a27a83043a044f8b98aaa128f8cf41f5556d7b8fddd224021ac7d28024daafed2362d4144b6" 
```

#### Multi signatures
```ruby
multisig_address = "Mxeda4bb5456f5eb8a19f57c8c6ec844d05feae879"
private_key1 = "4de029ca7b95c163f88c66e6351f2a986a48834b4681ec1e43eed5d120227103"
private_key2 = "49e48cd0f81e7aabfc840301c66f00318f50b25c79664c3f337d7ad4f919638e"
transaction = Minter::SendCoinTx.new(
    address_to: "Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497",
    value: 4_000_000_000_000_000_000,
    coin: 0,
    nonce: 2,
    chain_id: 2,
    gas_coin: 0,
    gas_price: 10
)
signed_tx = transaction.multisign(multisig_address, private_key1, private_key2)
#=> #<Minter::SignedTx:0x00007f97f0249ca0 @tx_hash="0xf8ce02020a8001a0df8094e7812ab98ac5ac37e2ab20da3136ad91bb22d497883782dace9d900000808002b8a3f8a194eda4bb5456f5eb8a19f57c8c6ec844d05feae879f88af8431ca04613dae08d6d729a2cb55cd1ef508fcabbd516c219cca15cff61bd5cff0dca2fa06dd29d4fa41517b1701520412f2892b82a10b0fd9b7ddf00060105d418e78f3bf8431ba0d13870020138ae7d6bc14dff8a720c97767af19b648facddb997a8c7baa771c2a01879cee21cd8e315752eae1190981541418fe49ff3def116fd123a2fd066ba84", @transaction=#<Minter::SendCoinTx:0x00007f97f11b2a48 @address_to="Mxe7812ab98ac5ac37e2ab20da3136ad91bb22d497", @value=4000000000000000000, @coin=0, @nonce=2, @chain_id=2, @gas_coin=0, @gas_price=10>> 
```

### Create transaction

#### Send transaction

Transaction for sending arbitrary coin.

coin - Symbol of a coin.
address_to - Recipient address in Minter Network.
value - Amount of Coin to send.

##### Example

```ruby
transaction = Minter::SendCoinTx.new(
        address_to: "Mx1b685a7c1e78726c48f619c497a07ed75fe00483",
        value: 1_000_000_000_000_000_000,
        coin: 1,
        nonce: 1,
        chain_id: 2,
        gas_coin: 1,
        gas_price: 1
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
      coin_to_sell: 1,
      value_to_sell: 1_000_000_000_000_000_000,
      coin_to_buy: 2,
      minimum_value_to_buy: 1_000_000_000_000_000_000,
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
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
  coin_to_sell: 1,
  coin_to_buy: 2,
  minimum_value_to_buy: 1_000_000_000_000_000_000,
  nonce: 1,
  chain_id: 2,
  gas_coin: 1,
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
Minter::BuyCoinTx.new(
  coin_to_buy: 2,
  value_to_buy: 1_000_000_000_000_000_000,
  coin_to_sell: 1,
  maximum_value_to_sell: 1_000_000_000_000_000_000,
  nonce: 1,
  chain_id: 2,
  gas_coin: 1,
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
  initial_reserve: 20_000_000_000_000_000_000_000,
  reserve_ratio: 10,
  max_supply: 1_000_000_000_000_000_000_000,
  nonce: 1,
  chain_id: 2,
  gas_coin: 1,
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
  coin: 1,
  stake: 5_000_000_000_000_000_000,
  nonce: 1,
  chain_id: 2,
  gas_coin: 1,
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
  coin: 1,
  value: 10_000_000_000_000_000_000,
  nonce: 1,
  chain_id: 2,
  gas_coin: 1,
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
    coin: 1,
    value: 10_000_000_000_000_000_000,
    nonce: 1,
    chain_id: 2,
    gas_coin: 1,
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
      gas_coin: 1,
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
      gas_coin: 1,
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
      gas_coin: 1,
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
      control_address: "Mx1b685a7c1e78726c48f619c497a07ed75fe00483",
      nonce: 1,
      chain_id: 2,
      gas_coin: 1,
      gas_price: 1
    )
```

#### Multisend transaction

Transaction for sending coins to multiple addresses.

```ruby
transaction = Minter::MultiSendTx.new(
    nonce: 1,
    chain_id: 2,
    gas_coin: 1,
    gas_price: 1
)

transaction.add_item(
    coin_id: 1,
    address_to: "Mxfe60014a6e9ac91618f5d1cab3fd58cded61ee99",
    value: 100_000_000_000_000_000
)

transaction.add_item(
    coin_id: 1,
    address_to: "Mxddab6281766ad86497741ff91b6b48fe85012e3c",
    value: 200_000_000_000_000_000
)

signed_tx = transaction.sign(private_key)
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

More info about [Minter Link Protocol](https://github.com/MinterTeam/minter-link-protocol)



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
rspec
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
