# frozen_string_literal: true

module Minter
  module Api
    module CandidateResource
      def candidate(public_key:, height: nil)
        path = "/candidate/#{public_key}"
        params = { height: height }.compact
        get(path, params)
      end

      def candidates(height: 1, include_stakes: nil)
        path = "/candidates"
        params = { height: height, include_stakes: nil }.compact
        get(path, params)
      end
    end
  end
end
