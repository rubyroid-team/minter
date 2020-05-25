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

    def tx_hash
      transaction_params = to_params

      result = JSON.parse(Minter::TxHashFfi.send(self.class.to_s.split("::")[1], transaction_params.to_json))
      raise TransactionError, result["error"] unless result["success"] == "true"

      result["tx_hash"]
    end
  end
end