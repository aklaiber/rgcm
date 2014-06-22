module Rgcm
  class Connector

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

  end
end