# frozen_string_literal: true

Dir[File.dirname(__FILE__) + "/resources/*.rb"].each do |file|
  require_relative file
end
require_relative "connection"

module Minter
  module Api
    class Client

      DEFAULT_NODE_URL = "https://node-api.testnet.minter.network/v2"

      attr_accessor :node_url, :authenticated_api_url, :api_version
      attr_accessor :proxy, :connect_timeout, :read_timeout, :write_timeout

      include Minter::Api::AddressResource
      include Minter::Api::BlockResource
      include Minter::Api::CandidateResource
      include Minter::Api::CoinResource
      include Minter::Api::Connection
      include Minter::Api::EstimateResource
      include Minter::Api::EventsResource
      include Minter::Api::MinGasPriceResource
      include Minter::Api::MaxGasResource
      include Minter::Api::MissedBlocksResource
      include Minter::Api::NonceResource
      include Minter::Api::SendTransactionResource
      include Minter::Api::StatusResource
      include Minter::Api::TransactionsResource
      include Minter::Api::ValidatorsResource

      DEFAULT_TIMEOUT = 30
      API_VERSION = 2

      def initialize(args = {})
        self.node_url = ENV["NODE_URL"] || DEFAULT_NODE_URL
        self.connect_timeout = args[:connect_timeout] || DEFAULT_TIMEOUT
        self.read_timeout = args[:read_timeout] || DEFAULT_TIMEOUT
        self.write_timeout = args[:write_timeout] || DEFAULT_TIMEOUT
      end

      def config
        {
          node_url: node_url,
          authenticated_api_url: authenticated_api_url,
          api_version: api_version,
          connect_timeout: connect_timeout,
          read_timeout: read_timeout,
          write_timeout: write_timeout,
          proxy: proxy
        }
      end
    end
  end
end
