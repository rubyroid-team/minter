# frozen_string_literal: true

require "typhoeus"
require "JSON"

module Minter
  class ApiClient
    MAINNET_BASE_URL = "https://gate-api.minter.network/api/"
    TESTNET_BASE_URL = "https://minter-node-1.testnet.minter.network:8841"
    LATEST_BLOCK_HEIGHT = 0

    def initialize(node_url = TESTNET_BASE_URL)
      @node_url = node_url
    end
  end
end
