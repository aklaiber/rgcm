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

    def results
      self.body[:results]
    end

    def errors
      self.results.select { |result| result.key?(:error) }
    end

    def successes
      self.results.select { |result| !result.key?(:error) }
    end

  end
end