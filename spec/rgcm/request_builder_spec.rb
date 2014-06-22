require 'spec_helper'

describe Rgcm::RequestBuilder do

  let(:api_key) { 'TEST_API_KEY' }
  let(:registration_id) { 123 }
  let(:collapse_key) { 'collapse key' }
  let(:data) { {score: '4x8', time: '15:16.2342'} }
  let(:request) { Rgcm::RequestBuilder.new(api_key, registration_id, collapse_key, data) }

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

  it 'returns collapse_key' do
    expect(json(request.build.options[:body])[:collapse_key]).to eql(collapse_key)
  end

  it 'returns data' do
    expect(json(request.build.options[:body])[:data]).to eql(data)
  end
end