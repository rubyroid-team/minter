package main

import (
	"C"
	"encoding/json"
	"github.com/MinterTeam/minter-go-sdk/transaction"
	"math/big"
)

//attach_function :CreateMultisigAddressTx, [:string], :string
//attach_function :DeclareCandidacyTx, [:string], :string
//attach_function :DelegateTx, [:string], :string
//attach_function :EditCandidateTx, [:string], :string
//attach_function :MultiSendTx, [:string], :string
//attach_function :RedeemCheckTx, [:string], :string
//attach_function :SellAllCoinTx, [:string], :string
//attach_function :SellCoinTx, [:string], :string
//attach_function :SendCoinTx, [:string], :string
//attach_function :SetCandidateOffTx, [:string], :string
//attach_function :SetCandidateOnTx, [:string], :string
//attach_function :UnbondTx, [:string], :string

//BuyCoinTx
type BuyCoinParams struct {
	CoinToBuy          string
	ValueToBuy         *big.Int
	CoinToSell         string
	MaximumValueToSell *big.Int

	ChainId  byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export BuyCoinTx
func BuyCoinTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}
	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}


// CreateCoinTX
type CreateCoinParams struct {
	Name           string
	Symbol         string
	InitialAmount  *big.Int
	InitialReserve *big.Int
	ReserveRation  uint
	MaxSupply      *big.Int

	ChainId  byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export CreateCoinTx
func CreateCoinTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}


// SendCoinTx
type SendCoinParams struct {
	AddressTo string
	Value     *big.Int
	Coin      string

	ChainId  byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export SendCoinTx
func SendCoinTx(paramsJson *C.char) *C.char {
	var params SendCoinParams
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

	encode, err := tx.Encode()
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

	ChainId byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export SellCoinTx
func SellCoinTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}
	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode })
	return C.CString(string(resultJson))
}

type SellAllCoinParams struct {
	CoinToSell        string
	CoinToBuy         string
	ValueToBuy        *big.Int
	MinimumValueToBuy *big.Int

	ChainId byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export SellAllCoinTx
func SellAllCoinTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode })
	return C.CString(string(resultJson))
}

type DeclareCandidacyParams struct {
	Address    string
	PubKey     string
	Commission uint
	Coin       string
	Stake      *big.Int

	ChainId byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export DeclareCandidacyTx
func DeclareCandidacyTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode })
	return C.CString(string(resultJson))
}

type DelegateParams struct {
	PubKey string
	Coin   string
	Value  *big.Int

	ChainId byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export DelegateTx
func DelegateTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
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

	ChainId byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export UnbondTx
func UnbondTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

type SetCandidateParams struct {
	PubKey string

	ChainId byte

	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export SetCandidateOffTx
func SetCandidateOffTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

//export SetCandidateOnTx
func SetCandidateOnTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
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

	ChainId byte
	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export RedeemCheckTx
func RedeemCheckTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
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

	ChainId byte

	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export EditCandidateTx
func EditCandidateTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
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
	Items   []MultiSendItem
	ChainId byte

	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export MultiSendTx
func MultiSendTx(paramsJson *C.char) *C.char {
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

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	resultJson, _ := json.Marshal(map[string]string{"success": "true", "tx_hash": encode})
	return C.CString(string(resultJson))
}

type MultisigAddressItem struct {
	Address string
	Weight  uint
}

type MultisigAddressParams struct {
	Addresses []MultisigAddressItem
	Threshold uint
	ChainId   byte

	Nonce    uint64
	GasPrice uint8
	GasCoin  string
}

//export CreateMultisigAddressTx
func CreateMultisigAddressTx(paramsJson *C.char) *C.char {
	var params MultisigAddressParams
	jsonBytes := []byte(C.GoString(paramsJson))
	err := json.Unmarshal(jsonBytes, &params)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	data := transaction.NewCreateMultisigData()

	for _, address := range params.Addresses {
		data.MustAddSigData(address.Address, address.Weight)
	}
	tx, err := transaction.NewBuilder(transaction.ChainID(params.ChainId)).NewTransaction(data)
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}
	tx.SetNonce(params.Nonce).SetGasPrice(params.GasPrice).SetGasCoin(params.GasCoin)

	encode, err := tx.Encode()
	if err != nil {
		resultJson, _ := json.Marshal(map[string]string{"success": "false", "error": err.Error()})
		return C.CString(string(resultJson))
	}

	result := map[string]string{
		"success":          "true",
		"tx_hash":          encode,
		"multisig_address": data.AddressString(),
	}
	resultJson, _ := json.Marshal(result)
	return C.CString(string(resultJson))
}

func main() {}
