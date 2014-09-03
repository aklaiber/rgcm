module Rgcm
  class RequestBuilder

    URI = 'https://android.googleapis.com/gcm/send'.freeze

    attr_reader :api_key, :registration_ids, :options, :data

    def initialize(api_key, registration_ids,  options, data)
      @api_key = api_key
      @registration_ids = registration_ids.kind_of?(Array) ? registration_ids : [registration_ids]
      @options = options
      @data = data
    end

    def build
      Typhoeus::Request.new(URI, headers: headers, method: :post, body: body.to_json, followlocation: true)
    end

    private

    def headers
      {'Authorization' => "key=#{api_key}", 'Content-Type' => 'application/json'}
    end

    def body
      body = {'registration_ids' => registration_ids}
      if options.present?
        body.merge!('collapse_key' => options[:collapse_key]) if options.has_key?(:collapse_key)
        body.merge!('time_to_live' => options[:time_to_live]) if options.has_key?(:time_to_live)
        body.merge!('delay_while_idle' => true) if options.has_key?(:time_to_live)
      end
      body.merge!('data' => data) if data.present?
      body
    end

  end
end