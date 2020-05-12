# frozen_string_literal: true

module Minter
  module Api
    module StatusResource
      def status
        path = "/status"
        get(path)
      end
    end
  end
end
