module Deploygate
  class Client
    class Config
      attr_accessor :token

      def initialize
        @token = ENV['DEPLOYGATE_TOKEN']
      end

    end
  end
end
