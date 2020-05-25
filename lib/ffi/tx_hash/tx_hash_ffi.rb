# frozen_string_literal: true

require "ffi"
module Minter
  module TxHashFfi
    extend FFI::Library
    filename = RUBY_PLATFORM.match('darwin') ? "/tx-hash-darwin-10.6-amd64.dylib" : "/tx-hash-linux-amd64.so"
    ffi_lib File.join(File.dirname(__FILE__), filename)
    attach_function :SendCoinTx, [:string], :string
  end
end
