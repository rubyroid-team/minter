module Minter
  class TransactionError < StandardError; end

  class Transaction
    def sign(private_key)
      params = to_params
      params[:PrivateKey] = private_key

      result = JSON.parse(Minter::TransactionFfi.send(self.class::SIGN_METHOD, params.to_json))
      if result["success"] == "true"
        SignedTx.new(tx_hash: result["tx_hash"], fee: result["fee"])
      else
        raise TransactionError, result["error"]
      end
    end
  end
end