# frozen_string_literal: true

module Minter
  class SignedTx
    attr_reader :tx_hash, :transaction

    def initialize(tx_hash: nil, transaction: nil)
      @tx_hash = tx_hash
      @transaction = transaction
    end

    def send
      Minter::Api::Client.new.send_transaction(transaction: tx_hash)
    end
  end
end
