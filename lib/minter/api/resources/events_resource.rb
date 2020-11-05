# frozen_string_literal: true

module Minter
  module Api
    module EventsResource
      def events(height: nil)
        height ||= 1
        path = "/events/#{height}"
        get(path)
      end
    end
  end
end
