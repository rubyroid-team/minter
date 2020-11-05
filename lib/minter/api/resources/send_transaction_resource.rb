# frozen_string_literal: true

module Minter
  module Api
    module SendTransactionResource
      def send_transaction(transaction:)
        path = "/send_transaction/#{transaction}"
        get(path)
      end
    end
  end
end
