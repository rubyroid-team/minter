# frozen_string_literal: true

module Minter
  module Api
    module MissedBlocksResource
      def missed_blocks(publicKey:, height: 1)
        params = { publicKey: publicKey, height: height }.compact
        path = "/missed_blocks"
        get(path, params)
      end
    end
  end
end
