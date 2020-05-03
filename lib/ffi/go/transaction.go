package main

import (
	"C"
	"encoding/json"
	"github.com/MinterTeam/minter-go-sdk/transaction"
	"math/big"
)

type TransactionParams struct {
	Nonce      uint64
	ChainId    byte
	Type       uint8
	AddressTo  string
	Value      *big.Int
	Coin       string
	GasPrice   uint8
	GasCoin    string
	PrivateKey string
}

//export SignTransaction
func SignTransaction(paramsJson *C.char) *C.char {
	var params TransactionParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	signedTransaction := createSignedTransaction(params)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

//export TransactionHash
func TransactionHash(paramsJson *C.char) *C.char {
	var params TransactionParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	signedTransaction := createSignedTransaction(params)
	hash, _ := signedTransaction.Hash()
	return C.CString(hash)
}

//export DecodeTransaction
func DecodeTransaction(txHash *C.char) *C.char {
	signedTransaction, _ := transaction.Decode(C.GoString(txHash))
	result, _ := json.Marshal(signedTransaction)
	return C.CString(string(result))
}

func createSignedTransaction(params TransactionParams) transaction.SignedTransaction {
	data, _ := transaction.NewSendData().SetCoin(params.Coin).SetValue(params.Value).SetTo(params.AddressTo)
	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)
	signedTransaction, _ := tx.Sign(params.PrivateKey)
	return signedTransaction
}

type CreateCoinParams struct {
	Name           string
	Symbol         string
	InitialAmount  *big.Int
	InitialReserve *big.Int
	ReserveRation  uint
	MaxSupply      *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignCreateCoinTransaction
func SignCreateCoinTransaction(paramsJson *C.char) *C.char {
	var params CreateCoinParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data := transaction.NewCreateCoinData().
		SetName(params.Name).
		SetSymbol(params.Symbol).
		SetInitialAmount(params.InitialAmount).
		SetInitialReserve(params.InitialReserve).
		SetConstantReserveRatio(params.ReserveRation).
		SetMaxSupply(params.MaxSupply)

	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

type SellCoinParams struct {
	CoinToSell        string
	ValueToSell       *big.Int
	CoinToBuy         string
	MinimumValueToBuy *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignSellCoinTransaction
func SignSellCoinTransaction(paramsJson *C.char) *C.char {
	var params SellCoinParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data := transaction.NewSellCoinData().
		SetCoinToSell(params.CoinToSell).
		SetValueToSell(params.ValueToSell).
		SetCoinToBuy(params.CoinToBuy).
		SetMinimumValueToBuy(params.MinimumValueToBuy)

	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

type BuyCoinParams struct {
	CoinToBuy          string
	ValueToBuy         *big.Int
	CoinToSell         string
	MaximumValueToSell *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignBuyCoinTransaction
func SignBuyCoinTransaction(paramsJson *C.char) *C.char {
	var params BuyCoinParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data := transaction.NewBuyCoinData().
		SetCoinToBuy(params.CoinToBuy).
		SetValueToBuy(params.ValueToBuy).
		SetCoinToSell(params.CoinToSell).
		SetMaximumValueToSell(params.MaximumValueToSell)

	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

type SellAllCoinParams struct {
	CoinToSell        string
	CoinToBuy         string
	ValueToBuy        *big.Int
	MinimumValueToBuy *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignSellAllCoinTransaction
func SignSellAllCoinTransaction(paramsJson *C.char) *C.char {
	var params SellAllCoinParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data := transaction.NewSellAllCoinData().
		SetCoinToSell(params.CoinToSell).
		SetCoinToBuy(params.CoinToBuy).
		SetMinimumValueToBuy(params.MinimumValueToBuy)

	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

type DeclareCandidacyParams struct {
	Address    string
	PubKey     string
	Commission uint
	Coin       string
	Stake      *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignDeclareCandidacyTransaction
func SignDeclareCandidacyTransaction(paramsJson *C.char) *C.char {
	var params DeclareCandidacyParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data, _ := transaction.NewDeclareCandidacyData().
		MustSetPubKey(params.PubKey).
		SetCommission(params.Commission).
		SetCoin(params.Coin).
		SetStake(params.Stake).
		SetAddress(params.Address)

	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

type DelegateParams struct {
	PubKey string
	Coin   string
	Value  *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignDelegateTransaction
func SignDelegateTransaction(paramsJson *C.char) *C.char {
	var params DelegateParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data := transaction.NewDelegateData().
		MustSetPubKey(params.PubKey).
		SetCoin(params.Coin).
		SetValue(params.Value)

	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

type SetCandidateOffParams struct {
	PubKey string

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignSetCandidateOffTransaction
func SignSetCandidateOffTransaction(paramsJson *C.char) *C.char {
	var params SetCandidateOffParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data := transaction.NewSetCandidateOffData().
		MustSetPubKey(params.PubKey)

	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}

func main() {}
