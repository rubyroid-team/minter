# frozen_string_literal: true

module Minter
  module Api
    class ClientError < StandardError; end
    class ParamsError < ClientError; end

    class ServerError < StandardError; end
    class ConnectionClosed < StandardError; end
    class BadRequestError < ServerError; end
    class NotFoundError < ServerError; end
    class ForbiddenError < ServerError; end
    class UnauthorizedError < ServerError; end
    class InternalServerError < ServerError; end
    class WebsocketError < ServerError; end
  end
end
