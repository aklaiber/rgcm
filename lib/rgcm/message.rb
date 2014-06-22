module Rgcm
  class Message
    attr_reader :connector

    def initialize(connector = Connector.new)
      @connector = connector
    end

    def post(registration_ids, collapse_key, data)

    end
  end
end