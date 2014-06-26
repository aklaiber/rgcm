module Rgcm
  class Config

    URI = 'https://android.googleapis.com/gcm/send'.freeze

    class << self
      attr_writer :config
    end

    def self.api_key
      @config['api_key']
    end
  end
end
