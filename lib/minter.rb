# frozen_string_literal: true

require "dotenv/load"
require "minter/api/client"

require "minter/version"
require "minter/wallet.rb"
require "minter/key.rb"
require "ffi/wallet/wallet_ffi.rb"
require "ffi/tx_hash/tx_hash_ffi.rb"
require "ffi/sign/sign_ffi.rb"
require "minter/transactions/transaction.rb"
Dir[File.dirname(__FILE__) + "/minter/transactions/*.rb"].each { |file| require_relative file }

module Minter
end
