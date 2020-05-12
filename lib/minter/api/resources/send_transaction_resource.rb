# frozen_string_literal: true

module Minter
  module Api
    module SendTransactionResource
      def send_transaction(transaction:)
        params = { tx: transaction }
        path = "/send_transaction"
        get(path, params)
      end
    end
  end
end
