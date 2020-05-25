package main

import (
	"C"
	"encoding/json"
	"github.com/MinterTeam/minter-go-sdk/transaction"
)

type SignParams struct {
	TxHash     string
	PrivateKey string
}

//export Sign
func Sign(paramsJson *C.char) *C.char {
	var params SignParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx, err := transaction.Decode(params.TxHash)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	signedTx, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode })
	return C.CString(string(resultJson))
}

type MultiSignParams struct {
	TxHash     string
	MultisigAddress string
	PrivateKeys []string
}

//export MultiSign
func MultiSign(paramsJson *C.char) *C.char {
	var params MultiSignParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	signedTx, err := transaction.Decode(params.TxHash)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	signedTx, err = signedTx.Sign(params.MultisigAddress, params.PrivateKeys... )
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode })
	return C.CString(string(resultJson))
}

func main() {}
