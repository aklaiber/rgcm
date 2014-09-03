module Rgcm
  class Response
    attr_reader :body

    def initialize(json)
      @body = JSON.parse(json, symbolize_names: true)
    end

    def count_successes
      self.body[:success]
    end

    def has_successes?
      self.count_successes > 0
    end

    def count_failures
      self.body[:failure]
    end

    def has_failures?
      self.count_failures > 0
    end

    def count_canonical_ids
      self.body[:canonical_ids]
    end

    def has_canonical_ids?
      self.count_canonical_ids > 0
    end

    def results
      self.body[:results]
    end

    def results_with_errors
      self.results.select { |result| result.key?(:error) }
    end

    def results_with_successes
      self.results.select { |result| !result.key?(:error) }
    end

    def results_with_canonical_ids
      self.results.select { |result| result.key?(:registration_id) }
    end

  end
end