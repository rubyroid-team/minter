# frozen_string_literal: true

require "http"
require_relative "errors"
require_relative "result"

module Minter
  module Api
    module Connection
      DEFAULT_HEADERS = [
        CONTENT_TYPE_HEADER = "application/json",
        ACCEPT_HEADER = "application/json"
      ].freeze

      def check_params(params, allowed_params)
        return params if (params.keys - allowed_params).empty?

        raise ParamsError
      end

      private

      def get(path, params = {})
        response = connection.get(build_url(config[:node_url], path), params: params)

        Minter::Api::Result.new(response)
      end

      def post(path, params = {})
        response = connection.post(build_url(config[:node_url], path), params: params)

        Minter::Api::Result.new(response)
      end

      def connection
        @connection ||= new_connection
      end

      def build_url(node_url, path)
        URI.parse(node_url + path)
      end

      def new_connection
        HTTP.timeout(timeout_config).headers(accept: ACCEPT_HEADER, content_type: CONTENT_TYPE_HEADER)
      end

      def timeout_config
        @timeout_config ||= {
          connect: config[:connect_timeout],
          write: config[:write_timeout],
          read: config[:read_timeout]
        }
      end
    end
  end
end
