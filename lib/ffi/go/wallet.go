package main

import (
	"C"
	"github.com/MinterTeam/minter-go-sdk/wallet"
)

//export NewMnemonic
func NewMnemonic() *C.char {
	mnemonic, _ := wallet.NewMnemonic()
	return C.CString(mnemonic)
}

//export PrivateKeyFromMnemonic
func PrivateKeyFromMnemonic(mnemonic *C.char) *C.char {
	seed, _ := wallet.Seed(C.GoString(mnemonic))
	prKey, _ := wallet.PrivateKeyBySeed(seed)
	return C.CString(string(prKey))
}

//export PublicKeyFromPrivateKey
func PublicKeyFromPrivateKey(prKey *C.char) *C.char {
	pubKey, _ := wallet.PublicKeyByPrivateKey(C.GoString(prKey))
	return C.CString(string(pubKey))
}

//export AddressFromMnemonic
func AddressFromMnemonic(mnemonic *C.char) *C.char {
	seed, _ := wallet.Seed(C.GoString(mnemonic))
	prKey, _ := wallet.PrivateKeyBySeed(seed)
	pubKey, _ := wallet.PublicKeyByPrivateKey(prKey)
	address, _ := wallet.AddressByPublicKey(pubKey)
	return C.CString(address)
}

//export AddressFromPrivateKey
func AddressFromPrivateKey(prKey *C.char) *C.char {
	pubKey, _ := wallet.PublicKeyByPrivateKey(C.GoString(prKey))
	address, _ := wallet.AddressByPublicKey(pubKey)
	return C.CString(address)
}

//export AddressFromPublicKey
func AddressFromPublicKey(mnemonic *C.char) *C.char {
	address, _ := wallet.AddressByPublicKey(C.GoString(mnemonic))
	return C.CString(address)
}

func main() {}
