package main

import (
	"C"
	"encoding/json"
	"fmt"
	"github.com/MinterTeam/minter-go-sdk/transaction"
	"math/big"
)

type TransactionParams struct {
	Nonce      uint64
	ChainId    byte
	Type       uint8
	AddressTo     string
	Value  *big.Int
	Coin   string
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

type CreateCoinTransactionParams struct {
	Name       string
	Symbol     string
	InitialAmount *big.Int
	InitialReserve *big.Int
	ReserveRation       uint
	MaxSupply *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}



//export SignCreateCoinTransaction
func SignCreateCoinTransaction(paramsJson *C.char) *C.char {
	var params CreateCoinTransactionParams
	jsonBytes := []byte(C.GoString(paramsJson))
	json.Unmarshal(jsonBytes, &params)

	data := transaction.NewCreateCoinData().
		SetName("SUPER COIN TEST").
		SetSymbol("SUPRA").
		SetInitialAmount(params.InitialAmount).
		SetInitialReserve(params.InitialReserve).
		SetConstantReserveRatio(params.ReserveRation).
		SetMaxSupply(params.MaxSupply)


	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	fmt.Println(params.GasPrice)

	signedTransaction, _ := tx.Sign(params.PrivateKey)
	encode, _ := signedTransaction.Encode()
	return C.CString(encode)
}


func main() {}
