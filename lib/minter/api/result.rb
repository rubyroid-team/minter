# frozen_string_literal: true

module Minter
  module Api
    class Result
      attr_reader :headers, :body, :status

      def initialize(response, **options)
        handle_error_response(response) if !response.status.success? && !options[:suppress_errors]

        @headers = response.headers
        @body = JSON.parse(response.body)
        @status = response.status
      end

      def to_h
        {
          headers: @headers.to_h,
          body: @body,
          status: @status.code
        }
      end

      def to_s
        to_h.slice(:body, :status).to_s
      end

      private

      def handle_error_response(response)
        response_body = JSON.parse(response.body)

        binding.pry

        case response.status.code
        when 400
          raise BadRequestError, response_body
        when 401
          raise UnauthorizedError, response_body
        when 403
          raise ForbiddenError, response_body
        when 404
          raise NotFoundError, response.uri.to_s
        when 412
          raise PreconditionFailedError, response_body["error"]
        when 429
          raise RateLimitError, response_body
        when 500
          raise InternalServerError, response_body
        else
          raise UnknownError, response_body
        end
      end
    end
  end
end
