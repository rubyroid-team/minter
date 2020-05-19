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
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data, err := transaction.NewSendData().SetCoin(params.Coin).SetValue(params.Value).SetTo(params.AddressTo)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)
	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
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
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewCreateCoinData().
		SetName(params.Name).
		SetSymbol(params.Symbol).
		SetInitialAmount(params.InitialAmount).
		SetInitialReserve(params.InitialReserve).
		SetConstantReserveRatio(params.ReserveRation).
		SetMaxSupply(params.MaxSupply)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}


	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
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
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewSellCoinData().
		SetCoinToSell(params.CoinToSell).
		SetValueToSell(params.ValueToSell).
		SetCoinToBuy(params.CoinToBuy).
		SetMinimumValueToBuy(params.MinimumValueToBuy)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
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
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewBuyCoinData().
		SetCoinToBuy(params.CoinToBuy).
		SetValueToBuy(params.ValueToBuy).
		SetCoinToSell(params.CoinToSell).
		SetMaximumValueToSell(params.MaximumValueToSell)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
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
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewSellAllCoinData().
		SetCoinToSell(params.CoinToSell).
		SetCoinToBuy(params.CoinToBuy).
		SetMinimumValueToBuy(params.MinimumValueToBuy)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
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
	err := json.Unmarshal(jsonBytes, &params)

	data, err := transaction.NewDeclareCandidacyData().
		MustSetPubKey(params.PubKey).
		SetCommission(params.Commission).
		SetCoin(params.Coin).
		SetStake(params.Stake).
		SetAddress(params.Address)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}
	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
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
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewDelegateData().
		MustSetPubKey(params.PubKey).
		SetCoin(params.Coin).
		SetValue(params.Value)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

type UnbondParams struct {
	PubKey string
	Coin   string
	Value  *big.Int

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignUnbondTransaction
func SignUnbondTransaction(paramsJson *C.char) *C.char {
	var params UnbondParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewUnbondData().
		MustSetPubKey(params.PubKey).
		SetCoin(params.Coin).
		SetValue(params.Value)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

type SetCandidateParams struct {
	PubKey string

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignSetCandidateOffTransaction
func SignSetCandidateOffTransaction(paramsJson *C.char) *C.char {
	var params SetCandidateParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewSetCandidateOffData().
		MustSetPubKey(params.PubKey)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

//export SignSetCandidateOnTransaction
func SignSetCandidateOnTransaction(paramsJson *C.char) *C.char {
	var params SetCandidateParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewSetCandidateOnData().
		MustSetPubKey(params.PubKey)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

type RedeemCheckParams struct {
	Check string
	Proof string

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignRedeemCheckTransaction
func SignRedeemCheckTransaction(paramsJson *C.char) *C.char {
	var params RedeemCheckParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewRedeemCheckData().
		MustSetProof(params.Proof).
		MustSetRawCheck(params.Check)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

type EditCandidateParams struct {
	PubKey        string
	RewardAddress string
	OwnerAddress  string

	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignEditCandidateTransaction
func SignEditCandidateTransaction(paramsJson *C.char) *C.char {
	var params EditCandidateParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewEditCandidateData().
		MustSetPubKey(params.PubKey).
		MustSetOwnerAddress(params.OwnerAddress).
		MustSetRewardAddress(params.RewardAddress)

	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

type MultiSendItem struct {
	AddressTo string
	Symbol    string
	Value     *big.Int
}

type MultiSendParams struct {
	Items      []MultiSendItem
	ChainId    byte
	PrivateKey string
	Nonce      uint64
	GasPrice   uint8
	GasCoin    string
}

//export SignMultiSendTransaction
func SignMultiSendTransaction(paramsJson *C.char) *C.char {
	var params MultiSendParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewMultisendData()

	for _, item := range params.Items {
		data.AddItem(
			*transaction.NewMultisendDataItem().
				SetCoin(item.Symbol).
				SetValue(item.Value).
				MustSetTo(item.AddressTo),
		)
	}
	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	signedTransaction, err := tx.Sign(params.PrivateKey)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	encode, err := signedTransaction.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}


//export DecodeTransaction
func DecodeTransaction(txHash *C.char) *C.char {
	signedTransaction, _ := transaction.Decode(C.GoString(txHash))
	result, _ := json.Marshal(signedTransaction)
	return C.CString(string(result))
}

func main() {}
