# frozen_string_literal: true

module Minter
  module Api
    module TransactionsResource

      def transaction_info(transaction_hash:)
        params = { hash: transaction_hash }
        path = "/transaction"
        get(path, params)
      end

      def send_transaction(transaction:)
        params = { tx: transaction }
        path = "/send_transaction"
        get(path, params)
      end

      def unconfirmed_transactions(limit)
        params = { limit: limit }
        path = "/send_transaction"
        get(path, params)
      end
    end
  end
end
