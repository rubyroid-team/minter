# frozen_string_literal: true

require "ffi"
module Minter
  module TransactionFfi
    extend FFI::Library
    ffi_lib "./lib/ffi/so/transaction.so"
    attach_function :SignTransaction, [:string], :string
  end
end
