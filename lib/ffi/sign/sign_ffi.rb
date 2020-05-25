# frozen_string_literal: true

require "ffi"
module Minter
  module SignFfi
    extend FFI::Library
    filename = RUBY_PLATFORM.match("darwin") ? "/sign-darwin-10.6-amd64.dylib" : "/sign-linux-amd64.so"
    ffi_lib File.join(File.dirname(__FILE__), filename)
    attach_function :Sign, [:string], :string
    attach_function :MultiSign, [:string], :string
  end
end
