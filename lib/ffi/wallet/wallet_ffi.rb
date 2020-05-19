# frozen_string_literal: true

require "ffi"
module Minter
  module WalletFfi
    extend FFI::Library
    filename = RUBY_PLATFORM.match('darwin') ? "/wallet-darwin-10.6-amd64.dylib" : "/wallet-linux-amd64.so"
    ffi_lib File.join(File.dirname(__FILE__), filename)
    attach_function :NewMnemonic, [], :string
    attach_function :PrivateKeyFromMnemonic, [:string], :string
    attach_function :PublicKeyFromPrivateKey, [:string], :string
    attach_function :AddressFromMnemonic, [:string], :string
    attach_function :AddressFromPrivateKey, [:string], :string
    attach_function :AddressFromPublicKey, [:string], :string
  end
end
