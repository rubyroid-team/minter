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
	DataTo     string
	DataValue  *big.Int
	DataCoin   string
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

func createSignedTransaction(params TransactionParams) transaction.SignedTransaction {
	data, _ := transaction.NewSendData().SetCoin(params.DataCoin).SetValue(params.DataValue).SetTo(params.DataTo)
	tx, _ := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)
	signedTransaction, _ := tx.Sign(params.PrivateKey)
	return signedTransaction
}

func main() {}
