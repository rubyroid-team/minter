# frozen_string_literal: true

module Minter
  module Api
    module MissedBlocksResource
      def missed_blocks(publicKey:, height: nil)
        params = { publicKey: publicKey, height: height }.compact
        path = "/missed_block"
        get(path, params)
      end
    end
  end
end
