<p align="center" background="black"><img src="minter-logo.svg" width="400"></p>

# Minter

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/minter/ruby/sdk`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'minter-ruby-sdk'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install minter-ruby-sdk

## About
This is a Ruby SDK for working with **Minter** blockchain

## Using Minter API 

* [Minter Api](#using-minterapi)
    - Methods:
	    - [Address](#address)
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
	    - [Send](#sendtransaction)
	    - [Status](#status)
	    - [Validators](#validators)
	    - [Transaction](#transaction)
	    - [Transactions](#transactions)
	    - [UnconfirmedTxs](#unconfirmedtxs)
	    - [Validators](#validators)
* [Minter SDK](#using-mintersdk)
    - [Create Transations](#create-transations)
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
	    - [Minter Key](#minter-key)
	    - [Minter Key](#minter-key)
	    - [Minter Key](#minter-key)
	    - [Minter Key](#minter-key)
			
* [Tests](#tests)


### Minter API
You can get all valid responses and full documentation at [Minter Node Api](https://docs.minter.network)

Create MinterAPI instance

```go
import "github.com/MinterTeam/minter-go-sdk/api"

nodeUrl := "https://minter-node-1.testnet.minter.network:8841"
minterClient := api.NewApi(nodeUrl)
```

### Address

Returns coins list, balance and transaction count (for nonce) of an address.

```go
func (a *Api) AddressAtHeight(address string, height int) (*AddressResult, error) {...}
````

##### Example

```go
response, err := minterClient.AddressAtHeight("Mxfe60014a6e9ac91618f5d1cab3fd58cded61ee99", api.LatestBlockHeight)

// &{Balance:map[CAPITAL:57010462073783319332082 KLM0VCOIN:16619033694080914686 MNT:41943252740815940564238] TransactionCount:81}
```

### Balance

Returns balance of an address.

```go
func (a *Api) BalanceAtHeight(address string, height int) (map[string]string, error) {...}
```

### Nonce

Returns next transaction number (nonce) of an address.

```go
func (a *Api) Nonce(address string) (uint64, error) {...}
```

##### Example

```go
nonce, err := minterClient.Nonce("Mxeeee1973381ab793719fff497b9a516719fcd5a2")
```

### Block

Returns block data at given height.

```go
func (a *Api) Block(height int) (*BlockResult, error) {...}
```

##### Example

```go
response, err := minterClient.Block(19)
```

### Candidate

Returns candidate’s info by provided public_key. It will respond with 404 code if candidate is not found.

```go
func (a *Api) CandidateAtHeight(pubKey string, height int) (*CandidateResult, error) {...}
```

##### Example

```go
response, err := minterClient.CandidateAtHeight(publicKey, api.LatestBlockHeight)

// &{RewardAddress:Mxee81347211c72524338f9680072af90744333146 OwnerAddress:Mxee81347211c72524338f9680072af90744333146 TotalStake:411815911951894107025876955 PubKey:Mp0d29a83e54653a1d5f34e561e0135f1e81cbcae152f1f327ab36857a7e32de4c Commission:100 Stakes:[{Owner:Mxee81347211c72524338f9680072af90744333146 Coin:MNT Value:411000000000000000000000000 BipValue:411000000000000000000000000} {Owner:Mx0004ae43810ac75200a0c681487d1748a4f1e0b3 Coin:TESTCOIN01 Value:31000000000000000000 BipValue:58901486017405331247} {Owner:Mxd231b4777c430da4070bc6ddbe4897812243dee5 Coin:MNT Value:999800000000000000000 BipValue:999800000000000000000} {Owner:Mx84dbe42bcb96de4a3f799fb0231f312b5914f2ea Coin:MNT Value:9765625000000000000 BipValue:9765625000000000000} {Owner:Mx506e94536a0b9b02e6393ab4743ad4660ed96640 Coin:MNT Value:100000000000000000000 BipValue:100000000000000000000} {Owner:Mx3ef60f4b47ce69fc741935ec9e3e058c72c76f50 Coin:MNT Value:2120918824665577665 BipValue:2120918824665577665} {Owner:Mx3ec303f29f9dafcef845743a4039cba9ab0fffa7 Coin:MNT Value:14451032630231196077 BipValue:14451032630231196077} {Owner:Mx952a5cea874ac69bd25102c143d71693de906ec7 Coin:MNT Value:32740220926399860702 BipValue:32740220926399860702} {Owner:Mx952a5cea874ac69bd25102c143d71693de906ec7 Coin:GOVNOCOIN3 Value:50000000000000000000000 BipValue:103209736084198678281} {Owner:Mx3ec303f29f9dafcef845743a4039cba9ab0fffa7 Coin:GOVNOCOIN3 Value:14869835499703502226824 BipValue:30694235950796940768} {Owner:Mx952a5cea874ac69bd25102c143d71693de906ec7 Coin:GOVNOCOIN4 Value:50000000000000000000000 BipValue:13277150942092457073837} {Owner:Mx3ec303f29f9dafcef845743a4039cba9ab0fffa7 Coin:GOVNOCOIN4 Value:3600000000000000000000 BipValue:955954867830656909316} {Owner:Mxd92903294385fbbe3fa806c8d3bb9bb916922e45 Coin:MNT Value:1610564000000000000000 BipValue:1610564000000000000000} {Owner:Mx3c57a889ec01714f26477f3758ee3b5c08bcabd3 Coin:MINTERPAY Value:250000000000000000000000 BipValue:27591235387156689505611} {Owner:Mx228e5a68b847d169da439ec15f727f08233a7ca6 Coin:MNT Value:1000000000000000000 BipValue:1000000000000000000} {Owner:Mx492da1475e270cca7f4ad9879357b6bc740a1abc Coin:BANANATEST Value:999000000000000000000 BipValue:2056371081317486602} {Owner:Mx3e3b5d6087f58f2592623a62da9618a2ee020d2d Coin:MNT Value:100000000000000000000000 BipValue:100000000000000000000000} {Owner:Mx9d5131d0f37934d1e47595543261008e29a3b9c4 Coin:MNT Value:10055039629613311735113 BipValue:10055039629613311735113} {Owner:Mxa7bd17b15f341ebd38a300a469744f1541f6ffcb Coin:MNT Value:550000000000000000000000 BipValue:550000000000000000000000} {Owner:Mxa7bd17b15f341ebd38a300a469744f1541f6ffcb Coin:MEONE Value:996000000000000000000 BipValue:993626519503202223180} {Owner:Mxa7bd17b15f341ebd38a300a469744f1541f6ffcb Coin:BIP Value:889000000000000000000 BipValue:889000000000000000000} {Owner:Mxed4d8865160c9896eb33d242aaca98261ac62272 Coin:MNT Value:100999800000000000000000 BipValue:100999800000000000000000} {Owner:Mxed4d8865160c9896eb33d242aaca98261ac62272 Coin:CAPITAL Value:8946315680512535288679 BipValue:3185058921395693358556} {Owner:Mx4427875d2254e2f25b2c527bf04fe5e83fc3322c Coin:MNT Value:1000000000000000000000 BipValue:1000000000000000000000} {Owner:Mxd06ff74d3bd520ae6be3ca4aac7cefa4b92fe96f Coin:MNT Value:3999782000000000000000 BipValue:3999782000000000000000}] CreatedAtBlock:1 Status:2}
```

### Candidates

Returns list of candidates.

```go
func (a *Api) CandidatesAtHeight(height int, includeStakes bool) ([]*CandidateResult, error) {...}
```

##### Example

```go
response, err := minterClient.CandidatesAtHeight(0, true)

// &{RewardAddress:Mxee81347211c72524338f9680072af90744333146 OwnerAddress:Mxee81347211c72524338f9680072af90744333146 TotalStake:411815911951894107025876955 PubKey:Mp0d29a83e54653a1d5f34e561e0135f1e81cbcae152f1f327ab36857a7e32de4c Commission:100 Stakes:[{Owner:Mxee81347211c72524338f9680072af90744333146 Coin:MNT Value:411000000000000000000000000 BipValue:411000000000000000000000000} {Owner:Mx0004ae43810ac75200a0c681487d1748a4f1e0b3 Coin:TESTCOIN01 Value:31000000000000000000 BipValue:58901486017405331247} {Owner:Mxd231b4777c430da4070bc6ddbe4897812243dee5 Coin:MNT Value:999800000000000000000 BipValue:999800000000000000000} {Owner:Mx84dbe42bcb96de4a3f799fb0231f312b5914f2ea Coin:MNT Value:9765625000000000000 BipValue:9765625000000000000} {Owner:Mx506e94536a0b9b02e6393ab4743ad4660ed96640 Coin:MNT Value:100000000000000000000 BipValue:100000000000000000000} {Owner:Mx3ef60f4b47ce69fc741935ec9e3e058c72c76f50 Coin:MNT Value:2120918824665577665 BipValue:2120918824665577665} {Owner:Mx3ec303f29f9dafcef845743a4039cba9ab0fffa7 Coin:MNT Value:14451032630231196077 BipValue:14451032630231196077} {Owner:Mx952a5cea874ac69bd25102c143d71693de906ec7 Coin:MNT Value:32740220926399860702 BipValue:32740220926399860702} {Owner:Mx952a5cea874ac69bd25102c143d71693de906ec7 Coin:GOVNOCOIN3 Value:50000000000000000000000 BipValue:103209736084198678281} {Owner:Mx3ec303f29f9dafcef845743a4039cba9ab0fffa7 Coin:GOVNOCOIN3 Value:14869835499703502226824 BipValue:30694235950796940768} {Owner:Mx952a5cea874ac69bd25102c143d71693de906ec7 Coin:GOVNOCOIN4 Value:50000000000000000000000 BipValue:13277150942092457073837} {Owner:Mx3ec303f29f9dafcef845743a4039cba9ab0fffa7 Coin:GOVNOCOIN4 Value:3600000000000000000000 BipValue:955954867830656909316} {Owner:Mxd92903294385fbbe3fa806c8d3bb9bb916922e45 Coin:MNT Value:1610564000000000000000 BipValue:1610564000000000000000} {Owner:Mx3c57a889ec01714f26477f3758ee3b5c08bcabd3 Coin:MINTERPAY Value:250000000000000000000000 BipValue:27591235387156689505611} {Owner:Mx228e5a68b847d169da439ec15f727f08233a7ca6 Coin:MNT Value:1000000000000000000 BipValue:1000000000000000000} {Owner:Mx492da1475e270cca7f4ad9879357b6bc740a1abc Coin:BANANATEST Value:999000000000000000000 BipValue:2056371081317486602} {Owner:Mx3e3b5d6087f58f2592623a62da9618a2ee020d2d Coin:MNT Value:100000000000000000000000 BipValue:100000000000000000000000} {Owner:Mx9d5131d0f37934d1e47595543261008e29a3b9c4 Coin:MNT Value:10055039629613311735113 BipValue:10055039629613311735113} {Owner:Mxa7bd17b15f341ebd38a300a469744f1541f6ffcb Coin:MNT Value:550000000000000000000000 BipValue:550000000000000000000000} {Owner:Mxa7bd17b15f341ebd38a300a469744f1541f6ffcb Coin:MEONE Value:996000000000000000000 BipValue:993626519503202223180} {Owner:Mxa7bd17b15f341ebd38a300a469744f1541f6ffcb Coin:BIP Value:889000000000000000000 BipValue:889000000000000000000} {Owner:Mxed4d8865160c9896eb33d242aaca98261ac62272 Coin:MNT Value:100999800000000000000000 BipValue:100999800000000000000000} {Owner:Mxed4d8865160c9896eb33d242aaca98261ac62272 Coin:CAPITAL Value:8946315680512535288679 BipValue:3185058921395693358556} {Owner:Mx4427875d2254e2f25b2c527bf04fe5e83fc3322c Coin:MNT Value:1000000000000000000000 BipValue:1000000000000000000000} {Owner:Mxd06ff74d3bd520ae6be3ca4aac7cefa4b92fe96f Coin:MNT Value:3999782000000000000000 BipValue:3999782000000000000000}] CreatedAtBlock:1 Status:2}
```

### CoinInfo

Returns information about coin.
Note: this method does not return information about base coins (MNT and BIP).

```go
func (a *Api) CoinInfoAtHeight(symbol string, height int) (*CoinInfoResult, error) {...}
```

##### Example

```go
response, err := minterClient.CoinInfoAtHeight("CAPITAL", api.LatestBlockHeight)

// &{Name:Minter Capital Symbol:CAPITAL Volume:160424270982998917252256781 Crr:80 ReserveBalance:57093621687856995327577694}
```

### EstimateCoinBuy

Return estimate of buy coin transaction.

```go
func (a *Api) EstimateCoinBuyAtHeight(coinToSell string, valueToBuy string, coinToBuy string, height int) (*EstimateCoinBuyResult, error) {...}
```

##### Example

```go
response, err := minterClient.EstimateCoinBuyAtHeight("BIP", "1", "MNT", api.LatestBlockHeight)

// &{WillPay:1 Commission:100000000000000000}
```

### EstimateCoinSell

Return estimate of sell coin transaction.

```go
func (a *Api) EstimateCoinSellAtHeight(coinToSell string, valueToSell string, coinToBuy string, height int) (*EstimateCoinSellResult, error) {...}
```

##### Example

```go
response, err := minterClient.EstimateCoinSellAtHeight("BIP", "1", "MNT", api.LatestBlockHeight)

// &{WillGet:1 Commission:100000000000000000}
```

### EstimateTxCommission

Return estimate of transaction.

```go
func (a *Api) EstimateTxCommission(transaction transaction.SignedTransaction) (*EstimateTxCommissionResult, error) {...}
```

##### Example

```go
signedTransaction, _ := transaction.Sign(privateKey)
response, _ := minterClient.EstimateTxCommission(signedTransaction)

// &{Commission:10000000000000000}
```

### Events

Returns events at given height.

```go
func (a *Api) EventsAtHeight(height int) (*EventsResult, error) {...}
```

##### Example

```go
response, err := minterClient.EventsAtHeight(12)

// &{Events:[{Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:111497225000000000000 role:DAO validator_pub_key:Mp4ae1ee73e6136c85b0ca933a9a1347758a334885f10b3238398a67ac2eb153b8]} {Type:minter/RewardEvent Value:map[address:Mx04bea23efb744dc93b4fda4c20bf4a21c6e195f1 amount:111497225000000000000 role:Developers validator_pub_key:Mp4ae1ee73e6136c85b0ca933a9a1347758a334885f10b3238398a67ac2eb153b8]} {Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:891977800000000000000 role:Validator validator_pub_key:Mp4ae1ee73e6136c85b0ca933a9a1347758a334885f10b3238398a67ac2eb153b8]} {Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:111497225000000000000 role:DAO validator_pub_key:Mp738da41ba6a7b7d69b7294afa158b89c5a1b410cbf0c2443c85c5fe24ad1dd1c]} {Type:minter/RewardEvent Value:map[address:Mx04bea23efb744dc93b4fda4c20bf4a21c6e195f1 amount:111497225000000000000 role:Developers validator_pub_key:Mp738da41ba6a7b7d69b7294afa158b89c5a1b410cbf0c2443c85c5fe24ad1dd1c]} {Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:891977800000000000000 role:Validator validator_pub_key:Mp738da41ba6a7b7d69b7294afa158b89c5a1b410cbf0c2443c85c5fe24ad1dd1c]} {Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:111497225000000000000 role:DAO validator_pub_key:Mp6f16c1ff21a6fb946aaed0f4c1fcca272b72fd904988f91d3883282b8ae31ba2]} {Type:minter/RewardEvent Value:map[address:Mx04bea23efb744dc93b4fda4c20bf4a21c6e195f1 amount:111497225000000000000 role:Developers validator_pub_key:Mp6f16c1ff21a6fb946aaed0f4c1fcca272b72fd904988f91d3883282b8ae31ba2]} {Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:891977800000000000000 role:Validator validator_pub_key:Mp6f16c1ff21a6fb946aaed0f4c1fcca272b72fd904988f91d3883282b8ae31ba2]} {Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:111497225000000000000 role:DAO validator_pub_key:Mp9e13f2f5468dd782b316444fbd66595e13dba7d7bd3efa1becd50b42045f58c6]} {Type:minter/RewardEvent Value:map[address:Mx04bea23efb744dc93b4fda4c20bf4a21c6e195f1 amount:111497225000000000000 role:Developers validator_pub_key:Mp9e13f2f5468dd782b316444fbd66595e13dba7d7bd3efa1becd50b42045f58c6]} {Type:minter/RewardEvent Value:map[address:Mx18467bbb64a8edf890201d526c35957d82be3d95 amount:891977800000000000000 role:Validator validator_pub_key:Mp9e13f2f5468dd782b316444fbd66595e13dba7d7bd3efa1becd50b42045f58c6]}]}
```

### MaxGas

Returns current max gas.

```go
func (a *Api) MaxGas() (string, error) {...}
```

##### Example

```go
response, err := minterClient.MaxGas()

// 100000
```

### MinGasPrice

Returns current min gas price.

```go
func (a *Api) MinGasPrice() (string, error) {...}
```

##### Example

```go
response, err := minterClient.MinGasPrice()

// 1
```

### MissedBlocks

Returns missed blocks by validator public key.

```go
func (a *Api) MissedBlocksAtHeight(pubKey string, height int) (*MissedBlocksResult, error) {...}
```

##### Example

```go
response, err := minterClient.MissedBlocksAtHeight("Mp1ada5ac409b965623bf6a4320260190038ae27230abfb5ebc9158280cdffffff", api.LatestBlockHeight)

// &{MissedBlocks:________________________ MissedBlocksCount:0}
```

### SendTransaction

Returns the result of sending __signed__ tx.

```go
func (a *Api) SendTransaction(transaction transaction.SignedTransaction) (*SendResult, error) {...}
```

##### Example

```go
signedTransaction, _ := transaction.Sign(privateKey)
res, _ := minterClient.SendTransaction(signedTransaction)

// &{Code:0 Data: Log: Hash:73740C0555B73AE245C9E21C3D146FED4C15B83923C70C792CA346C3D1892DEC}
```

### Status

Returns node status info.

```go
func (a *Api) Status() (*StatusResult, error) {...}
```

##### Example

```go
response, err := minterClient.Status()

// &{Version:1.0.3 LatestBlockHash:71F48E7096820DF4427EE7FBC93BBEE86167D5C76E6E4F21F73B719EBA82D7BD LatestAppHash:6B0CF291278BACE9817DAB3E808A5679B8BEBCCCD322FA8D3F2A304997352B64 LatestBlockHeight:1740266 LatestBlockTime:2019-10-02 11:36:52.504141439 +0000 UTC StateHistory:on TmStatus:{NodeInfo:{ProtocolVersion:{P2P:7 Block:10 App:5} ID:4735e67924e611b89fbd3f951441b5e912e226d3 ListenAddr:tcp://0.0.0.0:26656 Network:minter-test-network-41 Version:0.31.7 Channels:4020212223303800 Moniker:minter-node-1.testnet.minter.network Other:{TxIndex:on RPCAddress:tcp://0.0.0.0:26667}} SyncInfo:{LatestBlockHash:71F48E7096820DF4427EE7FBC93BBEE86167D5C76E6E4F21F73B719EBA82D7BD LatestAppHash:6B0CF291278BACE9817DAB3E808A5679B8BEBCCCD322FA8D3F2A304997352B64 LatestBlockHeight:1740266 LatestBlockTime:2019-10-02 11:36:52.504141439 +0000 UTC CatchingUp:false} ValidatorInfo:{Address:43253BE55C58BCA3045BEFABEF873944B56E3555 PubKey:{Type:tendermint/PubKeyEd25519 Value:DSmoPlRlOh1fNOVh4BNfHoHLyuFS8fMnqzaFen4y3kw=} VotingPower:80787843}}}
```

### Transaction

Returns transaction info.

```go
func (a *Api) Transaction(hash string) (*TransactionResult, error) {...}
```

##### Example

```go
response, err := minterClient.Transaction("Mt708c2019938339aba4bf6c2f771373bc43e0efa7df65c187950964321734cd82")

// &{Hash:708C2019938339ABA4BF6C2F771373BC43E0EFA7DF65C187950964321734CD82 RawTx:f904f60101018a424950000000000000000db9049af90497f90494eb8a424950000000000000009453d17305a4cac774af95ae17552225b4f418783f8a7f0e10af47c1c7000000eb8a424950000000000000009483209f7cf8638ed8b1a23a81f4fd58aabe26a3c28a1fc3842bd1f071c00000eb8a4249500000000000000094961b2b1bb1c768fb57c5b70ab0ff3cbe8ec753f18a1fc3842bd1f071c00000eb8a4249500000000000000094b51b38975f68665e8e8ce5caf3da3aa60191401a8a152d02c7e14af6800000eb8a4249500000000000000094bca89292e0414e5f24b4f02f37fc76cf76281e358a152d02c7e14af6800000eb8a4249500000000000000094f9d2aa52b1ee5e8d4c075743da675eea25d114b28a152d02c7e14af6800000eb8a4249500000000000000094a1561b51b2d3ccc65f9085e4f19de6700a7719cb8a048d8470181e32700000eb8a42495000000000000000946a2d8d0a11ee07726530089e4444a101ae1d7f9d8a084773deb33757440000eb8a4249500000000000000094ef27cf7b81823c122892bf1ac643877922a578d28a0249091605888fa00000eb8a4249500000000000000094a7cb3345baa756d0d32922c6615dd039cc48d45a8a01ebd92b352f8f240000eb8a4249500000000000000094ddc8d2365e03475c8a25ffa9ecd55d36d43ea3078a0152f9cea22fa5940000ea8a4249500000000000000094ef27cf7b81823c122892bf1ac643877922a578d289d9a7516b9e495c0000ea8a4249500000000000000094ddd3d550fe98aed42fe5c60882cf44e2a3d78d6689c01ee1471550600000ea8a4249500000000000000094de70d457298da5333dabd7c82e8f0743c6e71f1c89b826d85dec31f40000ea8a4249500000000000000094ddd3d550fe98aed42fe5c60882cf44e2a3d78d6689abbcd4ef3775800000ea8a42495000000000000000940f3ad3e6a753d5710d0106d18a5692a675ea49968997924b722838300000ea8a4249500000000000000094bfe5b2081daaf88074171b4823ddf99c4b6cf31e89968a9de2d2cbc40000ea8a42495000000000000000943be5571b68a3dbd2feb18cf6fd8b39abb535abbc896c6b935b8bbd400000ea8a42495000000000000000947c1c833bca1108b3ecdb57ba0f2ca6acf0dc51368949b9ca9a6943400000ea8a42495000000000000000941fcbcb8f4cbf069887c4813f23d8b581453352f589372f968667a3a80000ea8a4249500000000000000094bc4fd89edfed799da2b3ca4b9f1945341ebccd97893635c9adc5dea00000ea8a424950000000000000009442ba0e217da00d4c598b06a651f5bbb4833f4910893635c9adc5dea00000ea8a42495000000000000000949cef1a0cf90dcb1d748ba86af34d338cf14b14698917be78976065180000ea8a4249500000000000000094e91e77d171a9c855e454efa0e37ce1e7e7c17f30890cf4ca91b9465c0000ea8a42495000000000000000945be954fb59a42323b4db9dc14edd9c75d2b7aa4c89093739534d28680000ea8a424950000000000000009430dbc4350b08b100f8f8ff4de5d4660cec4b47cc89056bc75e2d63100000ea8a424950000000000000009450d9e92706ce51341c5f8f0c57afe1950a3ea92289019274b259f6540000808001b845f8431ba070f5c4d723659f73be9cac960bd7bf00127870e82e26deff619ecb1c0403ea6aa040192f0c0587c8ec1c449dd94c3dbb14b21be29770937de6d47a2c5c099c0a00 Height:3 Index:2 From:Mxf2958df65c35db500d84d809845d49ad3f9e1fbe Nonce:1 Gas:140 GasPrice:1 GasCoin:BIP Type:13 Data:map[list:[map[coin:BIP to:Mx53d17305a4cac774af95ae17552225b4f418783f value:600000000000000000000000] map[coin:BIP to:Mx83209f7cf8638ed8b1a23a81f4fd58aabe26a3c2 value:150000000000000000000000] map[coin:BIP to:Mx961b2b1bb1c768fb57c5b70ab0ff3cbe8ec753f1 value:150000000000000000000000] map[coin:BIP to:Mxb51b38975f68665e8e8ce5caf3da3aa60191401a value:100000000000000000000000] map[coin:BIP to:Mxbca89292e0414e5f24b4f02f37fc76cf76281e35 value:100000000000000000000000] map[coin:BIP to:Mxf9d2aa52b1ee5e8d4c075743da675eea25d114b2 value:100000000000000000000000] map[coin:BIP to:Mxa1561b51b2d3ccc65f9085e4f19de6700a7719cb value:21500000000000000000000] map[coin:BIP to:Mx6a2d8d0a11ee07726530089e4444a101ae1d7f9d value:39097000000000000000000] map[coin:BIP to:Mxef27cf7b81823c122892bf1ac643877922a578d2 value:10792000000000000000000] map[coin:BIP to:Mxa7cb3345baa756d0d32922c6615dd039cc48d45a value:9073000000000000000000] map[coin:BIP to:Mxddc8d2365e03475c8a25ffa9ecd55d36d43ea307 value:6253000000000000000000] map[coin:BIP to:Mxef27cf7b81823c122892bf1ac643877922a578d2 value:4015000000000000000000] map[coin:BIP to:Mxddd3d550fe98aed42fe5c60882cf44e2a3d78d66 value:3544000000000000000000] map[coin:BIP to:Mxde70d457298da5333dabd7c82e8f0743c6e71f1c value:3397000000000000000000] map[coin:BIP to:Mxddd3d550fe98aed42fe5c60882cf44e2a3d78d66 value:3168000000000000000000] map[coin:BIP to:Mx0f3ad3e6a753d5710d0106d18a5692a675ea4996 value:2796000000000000000000] map[coin:BIP to:Mxbfe5b2081daaf88074171b4823ddf99c4b6cf31e value:2777000000000000000000] map[coin:BIP to:Mx3be5571b68a3dbd2feb18cf6fd8b39abb535abbc value:2000000000000000000000] map[coin:BIP to:Mx7c1c833bca1108b3ecdb57ba0f2ca6acf0dc5136 value:1360000000000000000000] map[coin:BIP to:Mx1fcbcb8f4cbf069887c4813f23d8b581453352f5 value:1018000000000000000000] map[coin:BIP to:Mxbc4fd89edfed799da2b3ca4b9f1945341ebccd97 value:1000000000000000000000] map[coin:BIP to:Mx42ba0e217da00d4c598b06a651f5bbb4833f4910 value:1000000000000000000000] map[coin:BIP to:Mx9cef1a0cf90dcb1d748ba86af34d338cf14b1469 value:438000000000000000000] map[coin:BIP to:Mxe91e77d171a9c855e454efa0e37ce1e7e7c17f30 value:239000000000000000000] map[coin:BIP to:Mx5be954fb59a42323b4db9dc14edd9c75d2b7aa4c value:170000000000000000000] map[coin:BIP to:Mx30dbc4350b08b100f8f8ff4de5d4660cec4b47cc value:100000000000000000000] map[coin:BIP to:Mx50d9e92706ce51341c5f8f0c57afe1950a3ea922 value:29000000000000000000]]] Tags:{TxCoinToBuy: TxCoinToSell: TxReturn: TxType:0d TxFrom:f2958df65c35db500d84d809845d49ad3f9e1fbe TxTo:53d17305a4cac774af95ae17552225b4f418783f,83209f7cf8638ed8b1a23a81f4fd58aabe26a3c2,961b2b1bb1c768fb57c5b70ab0ff3cbe8ec753f1,b51b38975f68665e8e8ce5caf3da3aa60191401a,bca89292e0414e5f24b4f02f37fc76cf76281e35,f9d2aa52b1ee5e8d4c075743da675eea25d114b2,a1561b51b2d3ccc65f9085e4f19de6700a7719cb,6a2d8d0a11ee07726530089e4444a101ae1d7f9d,ef27cf7b81823c122892bf1ac643877922a578d2,a7cb3345baa756d0d32922c6615dd039cc48d45a,ddc8d2365e03475c8a25ffa9ecd55d36d43ea307,ef27cf7b81823c122892bf1ac643877922a578d2,ddd3d550fe98aed42fe5c60882cf44e2a3d78d66,de70d457298da5333dabd7c82e8f0743c6e71f1c,ddd3d550fe98aed42fe5c60882cf44e2a3d78d66,0f3ad3e6a753d5710d0106d18a5692a675ea4996,bfe5b2081daaf88074171b4823ddf99c4b6cf31e,3be5571b68a3dbd2feb18cf6fd8b39abb535abbc,7c1c833bca1108b3ecdb57ba0f2ca6acf0dc5136,1fcbcb8f4cbf069887c4813f23d8b581453352f5,bc4fd89edfed799da2b3ca4b9f1945341ebccd97,42ba0e217da00d4c598b06a651f5bbb4833f4910,9cef1a0cf90dcb1d748ba86af34d338cf14b1469,e91e77d171a9c855e454efa0e37ce1e7e7c17f30,5be954fb59a42323b4db9dc14edd9c75d2b7aa4c,30dbc4350b08b100f8f8ff4de5d4660cec4b47cc,50d9e92706ce51341c5f8f0c57afe1950a3ea922 TxCoin:}}
```

### Transactions

Return transactions by query.

```go
func (a *Api) Transactions(query string, page int, perPage int) ([]*TransactionResult, error) { {...}
```

##### Example

```go
response, err := minterClient.Transactions("tags.tx.coin='ZERO'", 0, 0)
```

### UnconfirmedTxs

Returns unconfirmed transactions.

```go
func (a *Api) UnconfirmedTxs(limit int) (*UnconfirmedTxsResult, error) {...}
```

##### Example

```go
response, err := minterClient.UnconfirmedTxs(0)

// &{NTxs:1 Total:1 TotalBytes:134 Txs:[+IRSAgGKTU5UAAAAAAAAAAGq6YpNTlQAAAAAAAAAlO6BNHIRxyUkM4+WgAcq+QdEMzFGiA3gtrOnZAAAgIABuEX4QxygcpfIQQO4plZ0pIDhCMHCcwps9nj1RSJi8/F820iftpmgTiaGYBtc91eaDFgbp3HzZ6Qve3TX//bisJnIaCr8wwE=]}
```

### Validators

Returns list of active validators.

```go
func (a *Api) ValidatorsAtHeight(height int) (*ValidatorsResult, error) {...}
```

##### Example

```go
response, err := minterClient.ValidatorsAtHeight(0)

// [&{PubKey:Mp8038275ca777c051b4baeefc09d05673f9b10d984395c1abed8e5cfae15be191 VotingPower:1296218} &{PubKey:Mp0d29a83e54653a1d5f34e561e0135f1e81cbcae152f1f327ab36857a7e32de4c VotingPower:80787843} &{PubKey:Mp14c93843ca40a62b9e7d02a824e7ffe83b49e3329ae963afdd7e500071ab9bfc VotingPower:17915937}]
```


## Using Minter SDK

### Sign transaction

Returns a signed tx.


#### Single signature

##### Example

```go
var data transaction.DataInterface
// data = ...
tx, _ := transaction.NewBuilder(TestNetChainID).NewTransaction(data)
tx.SetNonce(nonce).SetGasPrice(gasPrice).SetGasCoin(symbolMNT).SetSignatureType(transaction.SignatureTypeSingle)
signedTx, _ := tx.Sign(privateKey)
minterClient.SendTransaction(signedTx)
```

#### Multi signatures

##### Example

```go
var data transaction.DataInterface
var dataMultisig *transaction.CreateMultisigData
// data = ...
tx, _ := transaction.NewBuilder(TestNetChainID).NewTransaction(data)
tx.SetNonce(nonce).SetGasPrice(gasPrice).SetGasCoin(symbolMNT).SetMultiSignatureType(transaction.SignatureTypeMulti)
dataMultisig = transaction.NewCreateMultisigData().
		MustAddSigData("Mxee81347211c72524338f9680072af90744333143", 1).
		MustAddSigData("Mxee81347211c72524338f9680072af90744333145", 3).
		MustAddSigData("Mxee81347211c72524338f9680072af90744333144", 5).
		SetThreshold(7)
msigAddress := dataMultisig.AddressString()
signedTx, _ := tx.Sign(msigAddress, privateKey1, privateKey2, privateKey3)
minterClient.SendTransaction(signedTx)
```
You can transfer the transaction to the remaining addresses
```go
signedTx1, _ := tx.Sign(msigAddress, privateKey1)
encode, _ := signedTx.Encode()
// transfer encode transaction
signedTx1, _ = transaction.Decode(encode)
// and continue its signature by the remaining participants
signedTx12, _ := decode.Sign(msigAddress, privateKey2)
signedTx123, _ := decode.Sign(msigAddress, privateKey3)
minterClient.SendTransaction(signedTx123)
```
You can collect all signatures in one place without revealing the private key
```go
signedTx1, _ := tx.Sign(msigAddress, privateKey1)
signedTx2, _ := tx.Sign(msigAddress, privateKey2)
signedTx3, _ := tx.Sign(msigAddress, privateKey3)
simpleSignatureData1, _ := signedTx1.SimpleSignatureData()
simpleSignatureData2, _ := signedTx2.SimpleSignatureData()
simpleSignatureData3, _ := signedTx3.SimpleSignatureData()
signedTransaction, _ := tx0.Sign("Mxdb4f4b6942cb927e8d7e3a1f602d0f1fb43b5bd2")
signedTx123, _ := signedTransaction.AddSignature(simpleSignatureData1, simpleSignatureData2, simpleSignatureData3)
minterClient.SendTransaction(signedTx123)
```

#### Send transaction

Transaction for sending arbitrary coin.

coin - Symbol of a coin.
address_to - Recipient address in Minter Network.
value - Amount of Coin to send.

##### Example

```ruby
Minter::SendCoinTx.new(
      type: 1,
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

coin_to_buy - Symbol of a coin to get. value_to_buy - Amount of CoinToBuy to get. coin_to_sell - Symbol of a coin to give. maximum_value_to_sell - Maximum value of coins to sell.

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

#### Create multisig address

Transaction for creating multisignature address.

```go
data := transaction.NewCreateMultisigData().
		MustAddSigData("Mxee81347211c72524338f9680072af90744333143", 1).
		MustAddSigData("Mxee81347211c72524338f9680072af90744333145", 3).
		MustAddSigData("Mxee81347211c72524338f9680072af90744333144", 5).
		SetThreshold(7)
```

Get the multisig address to use it for transaction signatures

```go
msigAddress := dataMultisig.AddressString()
signedTx, _ := tx.Sign(msigAddress, privateKey1, privateKey2, privateKey3)
```
#### Multisend transaction

Transaction for sending coins to multiple addresses.

##### Example

```go
symbolMNT := "MNT"
data := transaction.
    NewMultisendData().
    AddItem(
        *transaction.NewMultisendDataItem().
            SetCoin(symbolMNT).
            SetValue(big.NewInt(0).Mul(big.NewInt(1), big.NewInt(0).Exp(big.NewInt(10), big.NewInt(18), nil))).
            MustSetTo("Mxfe60014a6e9ac91618f5d1cab3fd58cded61ee99"),
    ).AddItem(
        *transaction.NewMultisendDataItem().
            SetCoin(symbolMNT).
            SetValue(big.NewInt(0).Mul(big.NewInt(2), big.NewInt(0).Exp(big.NewInt(10), big.NewInt(18), nil))).
            MustSetTo("Mxddab6281766ad86497741ff91b6b48fe85012e3c"),
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

### Get fee of transaction

```go
signedTransaction, _ := transaction.Sign(privateKey)
fee := signedTransaction.Fee()
```

### Get hash of transaction

```go
hash, _ := signedTransaction.Hash()
```

### Get Public Key of transaction

```go
key, _ := signedTransaction.PublicKey()
```

### Get sender address of transaction

```go
address, _ := signedTransaction.SenderAddress()
```

### Decode Transaction

```go
transactionObject, _ := transaction.Decode("0xf8840102018a4d4e540000000000000001aae98a4d4e5400000000000000941b685a7c1e78726c48f619c497a07ed75fe00483880de0b6b3a7640000808001b845f8431ca01f36e51600baa1d89d2bee64def9ac5d88c518cdefe45e3de66a3cf9fe410de4a01bc2228dc419a97ded0efe6848de906fbe6c659092167ef0e7dcb8d15024123a")
```

### Minter Deep Links

```go
link, _ := NewDeepLink(
		NewSendData().
			MustSetTo("Mx18467bbb64a8edf890201d526c35957d82be3d95").
			SetCoin("BIP").
			SetValue(big.NewInt(0).Mul(big.NewInt(12345), big.NewInt(0).Exp(big.NewInt(10), big.NewInt(14), nil))),
	)
link.SetPayload([]byte("Hello World"))
encode, _ := link.Encode()
```

More info about [Minter Link Protocol](https://github.com/MinterTeam/minter-link-protocol)

### Minter Check

Minter Check is like an ordinary bank check. Each user of network can issue check with any amount of coins and pass it to another person. Receiver will be able to cash a check from arbitrary account.

* Create Issue Check. Nonce - unique "id" of the check. Coin Symbol - symbol of coin. Value - amount of coins. Due Block - defines last block height in which the check can be used.

```go
check := transaction.NewIssueCheck(
    480,
    TestNetChainID,
    999999,
    "MNT",
    big.NewInt(0).Mul(big.NewInt(10), big.NewInt(0).Exp(big.NewInt(10), big.NewInt(18), nil)),
).SetPassphrase("pass")
```

* Sign Issue Check

```go
sign, _ := check.Sign("2919c43d5c712cae66f869a524d9523999998d51157dc40ac4d8d80a7602ce02")
```

* Prepare check string and convert to data

```go
data, _ := transaction.DecodeIssueCheck("Mcf8a38334383002830f423f8a4d4e5400000000000000888ac7230489e80000b841d184caa333fe636288fc68d99dea2c8af5f7db4569a0bb91e03214e7e238f89d2b21f4d2b730ef590fd8de72bd43eb5c6265664df5aa3610ef6c71538d9295ee001ba08bd966fc5a093024a243e62cdc8131969152d21ee9220bc0d95044f54e3dd485a033bc4e03da3ea8a2cd2bd149d16c022ee604298575380db8548b4fd6672a9195")
``` 

* Proof check

```go
check, _ := transaction.NewCheckAddress("Mxa7bc33954f1ce855ed1a8c768fdd32ed927def47", "pass")
proof, _ := check.Proof()
```

### Minter Wallet

* Create wallet. This method returns generated seed, private key, public key, mnemonic and Minter address.

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


### Minter Key
* Generate mnemonic.

```ruby
mnemonic = Minter::Key.new_mnemonic
#=> "rice joy gift diamond wisdom scout junk keen math page firm regular"
```

* Get private key from mnemonic.

```ruby
private_key = Minter::Key.private_key_from_mnemonic(mnemonic)
# => "4f9706c0fa8f63a9481379579b4e6ab2d1e41ae8adab0885f58dc6a4859451be"
```

* Get public key from private key.

```ruby
public_key = Minter::Key.public_key_from_private_key(private_key)
#=> "Mp4357760042c69a3414b9f66236e0cf0cc583c2bb49dff7c3cf68968df1e131bfa54483d0da3291dcba8980cf86ebe8c4d38186efe7322d5d7a3d5501149e6fb0"
```

* Get Minter address from public key.

```ruby
address  = Minter::Key.address_from_public_key(public_key)
#=> "Mx703323dfeabdffc976c62fb156c58ea41606831e"
```

* Get Minter address from private key.
```ruby
address  = Minter::Key.address_from_private_key(private_key)
#=> "Mx703323dfeabdffc976c62fb156c58ea41606831e"
```

* Get Minter address from mnemonic.
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
