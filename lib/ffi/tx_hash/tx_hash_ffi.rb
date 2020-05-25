# frozen_string_literal: true

require "ffi"
module Minter
  module TxHashFfi
    extend FFI::Library
    filename = RUBY_PLATFORM.match("darwin") ? "/tx-hash-darwin-10.6-amd64.dylib" : "/tx-hash-linux-amd64.so"
    ffi_lib File.join(File.dirname(__FILE__), filename)
    attach_function :BuyCoinTx, [:string], :string
    attach_function :CreateCoinTx, [:string], :string
    attach_function :CreateMultisigAddressTx, [:string], :string
    attach_function :GetMultisigAddress, [:string], :string
    attach_function :DeclareCandidacyTx, [:string], :string
    attach_function :DelegateTx, [:string], :string
    attach_function :EditCandidateTx, [:string], :string
    attach_function :MultiSendTx, [:string], :string
    attach_function :RedeemCheckTx, [:string], :string
    attach_function :SellAllCoinTx, [:string], :string
    attach_function :SellCoinTx, [:string], :string
    attach_function :SendCoinTx, [:string], :string
    attach_function :SetCandidateOffTx, [:string], :string
    attach_function :SetCandidateOnTx, [:string], :string
    attach_function :UnbondTx, [:string], :string
  end
end
