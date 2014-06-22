require 'spec_helper'

describe Rgcm::Message do

  let(:data) { {score: '4x8', time: '15:16.2342'} }

  before do
    Typhoeus.stub(Rgcm::Config::URI).and_return(Typhoeus::Response.new(code: 200, body: json))
  end

  let(:json) { File.open("#{FIXTURES_PATH}/responses/successfully.json").read }

  it 'returns rgcm response' do
    response = Rgcm::Message.new('TEST_API_KEY').post('test', 'test', data)

    expect(response).to be_kind_of(Rgcm::Response)
  end

end