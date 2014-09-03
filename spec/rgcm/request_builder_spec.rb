require 'spec_helper'

describe Rgcm::RequestBuilder do

  let(:api_key) { 'TEST_API_KEY' }
  let(:registration_id) { 123 }
  let(:collapse_key) { 'collapse key' }
  let(:data) { {score: '4x8', time: '15:16.2342'} }
  let(:request) { Rgcm::RequestBuilder.new(api_key, registration_id, nil, nil) }

  it 'returns uri' do
    expect(request.build.base_url).to eql(Rgcm::Config::URI)
  end

  it 'returns authorization' do
    expect(request.build.options[:headers]['Authorization']).to eql("key=#{api_key}")
  end

  it 'returns content type' do
    expect(request.build.options[:headers]['Content-Type']).to eql('application/json')
  end

  it 'returns registration_id' do
    expect(json(request.build.options[:body])[:registration_ids]).to eql([registration_id])
  end

  context 'with collapse_key' do
    it 'returns request' do
      request = Rgcm::RequestBuilder.new(api_key, registration_id, {collapse_key: collapse_key}, nil)
      expect(json(request.build.options[:body])[:collapse_key]).to eql(collapse_key)
    end
  end

  context 'with data' do
    it 'returns request' do
      request = Rgcm::RequestBuilder.new(api_key, registration_id, nil, data)
      expect(json(request.build.options[:body])[:data]).to eql(data)
    end
  end

  context 'with data' do
    it 'returns request' do
      request = Rgcm::RequestBuilder.new(api_key, registration_id, {time_to_live: 0}, data).build

      expect(json(request.options[:body])[:time_to_live]).to eql(0)
      expect(json(request.options[:body])[:delay_while_idle]).to eql(true)
    end
  end
end