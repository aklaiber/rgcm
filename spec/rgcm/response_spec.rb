require 'spec_helper'

describe Rgcm::Response do
  let(:response) { Rgcm::Response.new(json) }

  context 'with successfully response' do
    let(:json) { File.open("#{FIXTURES_PATH}/responses/successfully.json").read }
    it '#has_successes?' do
      expect(response.has_successes?).to be true
    end
    it '#has_failures?' do
      expect(response.has_failures?).to be false
    end
    it '#count_successes' do
      expect(response.count_successes).to eql(1)
    end
    it '#has_failures?' do
      expect(response.count_failures).to eql(0)
    end
  end

  context 'with failure response' do
    let(:json) { File.open("#{FIXTURES_PATH}/responses/failure.json").read }
    it '#has_successes?' do
      expect(response.has_successes?).to be false
    end
    it '#has_failures?' do
      expect(response.has_failures?).to be true
    end
    it '#count_successes' do
      expect(response.count_successes).to eql(0)
    end
    it '#has_failures?' do
      expect(response.count_failures).to eql(1)
    end
    it '#errors' do
      expect(response.results_with_errors.size).to eql(1)
    end
  end

  context 'with failure response' do
    let(:json) { File.open("#{FIXTURES_PATH}/responses/multi.json").read }
    it '#has_successes?' do
      expect(response.has_successes?).to be true
    end
    it '#has_failures?' do
      expect(response.has_failures?).to be true
    end
    it '#count_successes' do
      expect(response.count_successes).to eql(3)
    end
    it '#has_failures?' do
      expect(response.count_failures).to eql(11)
    end
    it '#errors' do
      expect(response.results_with_errors.size).to eql(11)
    end
    it '#successes' do
      expect(response.results_with_successes.size).to eql(3)
    end
  end

  context 'with canonical_ids' do
    let(:json) { File.open("#{FIXTURES_PATH}/responses/with_cannonical_ids.json").read }

    it '#has_canonical_ids?' do
      expect(response.has_canonical_ids?).to be true
    end
    it '#count_canonical_ids' do
      expect(response.count_canonical_ids).to eql(1)
    end
    it '#canonical_ids' do
      expect(response.results_with_canonical_ids.size).to eql(1)
    end
  end
end