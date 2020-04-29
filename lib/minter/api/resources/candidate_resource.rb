# frozen_string_literal: true

module Minter
  module Api
    module CandidateResource
      def candidate(public_key:, height: nil)
        path = "/candidate"
        params = { address: address, height: height }.compact
        get(path, params)
      end

      def candidates(public_key:, height: nil, include_stakes: nil)
        path = "/candidates"
        params = { address: address, height: height, include_stakes: nil }.compact
        get(path, params)
      end
    end
  end
end
