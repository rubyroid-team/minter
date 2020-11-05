# frozen_string_literal: true

module Minter
  module Api
    module TransactionsResource
      def transaction_info(transaction_hash:)
        path = "/transaction/#{transaction_hash}"
        get(path)
      end

      def transactions(query:, page: 1, per_page: 10)
        params = { query: query, page: page, per_page: per_page }
        path = "/transactions"
        get(path, params)
      end

      def unconfirmed_transactions(limit: 1)
        params = { limit: limit }
        path = "/unconfirmed_txs"
        get(path, params)
      end
    end
  end
end
