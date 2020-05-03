# frozen_string_literal: true

module Minter
  class SignedTx
    attr_reader :tx_hash

    def initialize(tx_hash)
      @tx_hash = tx_hash
    end

    def send
      # TODO: maybe create client one time
      Minter::Api::Client.new.send_transaction(transaction: tx_hash)
    end
  end
end
