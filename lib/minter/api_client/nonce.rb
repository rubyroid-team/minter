# frozen_string_literal: true

module Minter
  class ApiClient
    def nonce(address)
      address_at_height(address, 0)["transaction_count"].to_i + 1
    end
  end
end
