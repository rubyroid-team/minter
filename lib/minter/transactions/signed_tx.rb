# frozen_string_literal: true

module Minter
  class SignedTx
    attr_reader :tx_hash, :fee

    def initialize(tx_hash: nil, fee: nil)
      @tx_hash = tx_hash
      @fee = fee
    end

    def send
      Minter::Api::Client.new.send_transaction(transaction: tx_hash)
    end
  end
end
