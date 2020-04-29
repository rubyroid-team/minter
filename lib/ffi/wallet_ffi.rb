# frozen_string_literal: true

require "ffi"
module Minter
  module WalletFfi
    extend FFI::Library
    ffi_lib "./lib/ffi/so/wallet.so"
    attach_function :NewMnemonic, [], :string
    attach_function :PrivateKeyFromMnemonic, [:string], :string
    attach_function :PublicKeyFromPrivateKey, [:string], :string
    attach_function :AddressFromMnemonic, [:string], :string
    attach_function :AddressFromPrivateKey, [:string], :string
    attach_function :AddressFromPublicKey, [:string], :string
  end
end
