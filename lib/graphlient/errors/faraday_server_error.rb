module Graphlient
  module Errors
    class FaradayServerError < ServerError
      def initialize(inner_exception)
        super(inner_exception.message, inner_exception)
        @inner_exception = inner_exception

        @response = begin
          raw_response = inner_exception.response[:body]
          JSON.parse(raw_response)
        rescue StandardError
          raw_response
        end

        @status_code = inner_exception.response[:status]
      end
    end
  end
end
