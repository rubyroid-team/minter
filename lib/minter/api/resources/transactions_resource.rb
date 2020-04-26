module Minter
  module Api
    module TransactionsResource
      def send_transaction(transaction:)
        params = { transaction: transaction }
        path =  '/send_transaction'
        get(path, params)
      end

      def unconfirmed_transactions(limit)
        params = { limit: limit }
        path =  '/send_transaction'
        get(path, params)
      end
    end
  end
end
