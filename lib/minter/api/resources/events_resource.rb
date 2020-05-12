# frozen_string_literal: true

module Minter
  module Api
    module EventsResource
      def events(height: nil)
        height ||= LatestBlockHeight
        params = { height: height }
        path = "/events"
        get(path, params)
      end
    end
  end
end
