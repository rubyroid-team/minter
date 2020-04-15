
module Minter
  module Key
    def self.new_mnemonic
      Minter::WalletFfi.NewMnemonic
    end

    def self.private_key_from_mnemonic(mnemonic)
      Minter::WalletFfi.PrivateKeyFromMnemonic(mnemonic)
    end


    def self.public_key_from_private_key(private_key)
      Minter::WalletFfi.PublicKeyFromPrivateKey(private_key)
    end

    def self.address_from_mnemonic(mnemonic)
      Minter::WalletFfi.AddressFromMnemonic(mnemonic)
    end

    def self.address_from_private_key(private_key)
      Minter::WalletFfi.AddressFromPrivateKey(private_key)
    end

    def self.address_from_public_key(public_key)
      Minter::WalletFfi.AddressFromPublicKey(public_key)
    end
  end
end


