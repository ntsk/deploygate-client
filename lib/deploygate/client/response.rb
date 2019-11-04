module Deploygate
  class Client
    class Response
      attr_accessor :body, :headers, :status

      def initialize(f_response)
        @body = f_response.body
        @headers = f_response.headers
        @status = f_response.status
      end

      def success?
        (200..299).include?(status)
      end

    end
  end
end
