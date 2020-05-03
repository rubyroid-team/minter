# frozen_string_literal: true

require "ffi"
module Minter
  module TransactionFfi
    extend FFI::Library
    ffi_lib "./lib/ffi/so/transaction.so"
    attach_function :SignTransaction, [:string], :string
    attach_function :TransactionHash, [:string], :string
    attach_function :DecodeTransaction, [:string], :string
    attach_function :SignCreateCoinTransaction, [:string], :string
    attach_function :SignSellCoinTransaction, [:string], :string
    attach_function :SignBuyCoinTransaction, [:string], :string
    attach_function :SignSellAllCoinTransaction, [:string], :string
  end
end

# ===SEND MNT===
# tx_params = {
#     Nonce: 27,
#     ChainId: 2,
#     Type: 1,
#     AddressTo: "Mx7633980c000139dd3bd24a3f54e06474fa941e16",
#     Value: 24_000_000_000_000_000_000,
#     Coin: "MNT",
#     GasCoin: "MNT",
#     GasPrice: 10,
#     PrivateKey: "290cd647206bea71ec06d8dfacce30c872aea3fb1ea333b7f475b70467250ca0"
# }
# tx = Minter::TransactionFfi.SignTransaction(tx_params.to_json)
# Minter::Api::Client.new.send_transaction(transaction: tx)

# ==CREATE COIN==
# tx_params = {
#     Name: "DEVTWO",
#     Symbol: "DEVTWO",
#     InitialAmount: 1000000000000000000,
#     MaxSupply: 10000000000000000000,
#     InitialReserve: 10000,
#     ReserveRation: 10,
#
#     Nonce: 29,
#     ChainId: 2,
#     GasCoin: "MNT",
#     GasPrice: 1,
#     PrivateKey: "290cd647206bea71ec06d8dfacce30c872aea3fb1ea333b7f475b70467250ca0"
# }
#
# tx = Minter::TransactionFfi.SignCreateCoinTransaction(tx_params.to_json)
# Minter::Api::Client.new.send_transaction(transaction: tx)

# ===SELL_COIN===
# tx_params = {
#     CoinToSell: "DEVDEV",
#     ValueToSell: 1000,
#     CoinToBuy: "MNT",
#     MinimumValueToBuy: 100000000,
#
#     Nonce: 31,
#     ChainId: 2,
#     GasCoin: "MNT",
#     GasPrice: 1,
#     PrivateKey: "290cd647206bea71ec06d8dfacce30c872aea3fb1ea333b7f475b70467250ca0"
# }
#
# tx = Minter::TransactionFfi.SignSellCoinTransaction(tx_params.to_json)
# Minter::Api::Client.new.send_transaction(transaction: tx)

# ===BUY_COIN===
# tx_params = {
#     CoinToBuy: "DEVDEV",
#     ValueToBuy: 1000,
#     CoinToSell: "MNT",
#     MaximumValueToSell: 100000000,
#
#     Nonce: 31,
#     ChainId: 2,
#     GasCoin: "MNT",
#     GasPrice: 1,
#     PrivateKey: "290cd647206bea71ec06d8dfacce30c872aea3fb1ea333b7f475b70467250ca0"
# }
#
# tx = Minter::TransactionFfi.SignBuyCoinTransaction(tx_params.to_json)
# Minter::Api::Client.new.send_transaction(transaction: tx)
