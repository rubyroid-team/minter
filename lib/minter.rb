# frozen_string_literal: true

require "dotenv/load"
require "minter/api/client"

require "minter/version"
require "minter/wallet.rb"
require "minter/key.rb"
require "ffi/wallet/wallet_ffi.rb"
require "ffi/transaction/transaction_ffi.rb"
Dir[File.dirname(__FILE__) + "/minter/transactions/*.rb"].each { |file| require_relative file }

module Minter
end
