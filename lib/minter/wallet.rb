# frozen_string_literal: true

module Minter
  class Wallet
    attr_reader :seed, :private_key, :public_key, :mnemonic, :address
    def initialize(_options = {})
      @mnemonic = Minter::WalletFfi.NewMnemonic
      @private_key = Minter::WalletFfi.PrivateKeyFromMnemonic(@mnemonic)
      @public_key = Minter::WalletFfi.PublicKeyFromPrivateKey(@private_key)
      @address = Minter::WalletFfi.AddressFromMnemonic(@mnemonic)
    end
  end
end
