# frozen_string_literal: true

require "minter/version"
require "minter/wallet.rb"
require "minter/key.rb"
require "minter/api_client"
require "minter/transaction.rb"
require "minter/api_client/address.rb"
require "minter/api_client/balance.rb"
require "minter/api_client/block.rb"
require "minter/api_client/nonce.rb"
require "minter/api_client/coin_info.rb"
require "minter/api_client/events.rb"
require "minter/api_client/max_gas.rb"
require "minter/api_client/min_gas_price.rb"
require "minter/api_client/transaction.rb"
require "ffi/wallet.rb"

module Minter
  def self.minter
    puts "minter gem"
  end
end
