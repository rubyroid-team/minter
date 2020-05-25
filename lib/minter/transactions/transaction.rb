# frozen_string_literal: true

module Minter
  class TransactionError < StandardError; end
  class SignError < StandardError; end

  class Transaction
    def sign(private_key)
      sign_params = {}
      sign_params[:PrivateKey] = private_key
      sign_params[:TxHash] = tx_hash

      result = JSON.parse(Minter::SignFfi.Sign(sign_params.to_json))
      raise SignError, result["error"] unless result["success"] == "true"

      SignedTx.new(tx_hash: result["tx_hash"], transaction: self)
    end

    def multisign(multisig_address, *private_keys)
      multisign_params = {}
      multisign_params[:PrivateKeys] = private_keys
      multisign_params[:TxHash] = tx_hash(multisign: true)
      multisign_params[:MultiSigAddress] = multisig_address

      result = JSON.parse(Minter::SignFfi.MultiSign(multisign_params.to_json))
      raise SignError, result["error"] unless result["success"] == "true"

      SignedTx.new(tx_hash: result["tx_hash"], transaction: self)
    end

    def tx_hash(multisign: false)
      transaction_params = to_params
      transaction_params[:SignatureType] = multisign ? 2 : 1

      result = JSON.parse(Minter::TxHashFfi.send(self.class.to_s.split("::")[1], transaction_params.to_json))
      raise TransactionError, result["error"] unless result["success"] == "true"

      result["tx_hash"]
    end
  end
end
