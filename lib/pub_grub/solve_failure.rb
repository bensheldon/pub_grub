require_relative 'failure_writer'

module PubGrub
  class SolveFailure < StandardError
    def initialize(incompatibility)
      @incompatibility = incompatibility
    end

    def to_s
      "Could not find compatible versions\n\n#{explanation}"
    end

    def explanation
      @explanation ||= FailureWriter.new(@incompatibility).write
    end
  end
end
