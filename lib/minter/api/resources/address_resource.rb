module Minter
  module Api
    module AddressResource
      def address(address:, height: nil)
        params = { address: address, height: height }.compact
        path =  '/address'

        get(path, params)
      end

      def addresses(params)
        path =  '/address'
        get(path)
      end
    end
  end
end
