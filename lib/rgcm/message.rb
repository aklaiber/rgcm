module Rgcm
  class Message

    attr_reader :api_key

    def initialize(config = Rgcm::Config)
      if config.kind_of?(String)
        @api_key = config
      elsif config.kind_of?(Hash)
        @api_key = config[:api_key]
      elsif config.kind_of?(Class)
        @api_key = config.api_key
      end
    end

    def post(registration_ids, data, options=nil)
      request = RequestBuilder.new(api_key, registration_ids, options, data).build

      response = request.run

      Rgcm::Response.new(response.body)
    end

  end
end