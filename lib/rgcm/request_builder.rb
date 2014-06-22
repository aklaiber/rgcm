module Rgcm
  class RequestBuilder

    URI = 'https://android.googleapis.com/gcm/send'.freeze

    attr_reader :api_key, :registration_ids, :collapse_key, :data

    def initialize(api_key, registration_ids,  collapse_key, data)
      @api_key = api_key
      @registration_ids = registration_ids.kind_of?(Array) ? registration_ids : [registration_ids]
      @collapse_key = collapse_key
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
      body.merge!('collapse_key' => collapse_key) if collapse_key.present?
      body.merge!('data' => data) if data.present?
    end

  end
end