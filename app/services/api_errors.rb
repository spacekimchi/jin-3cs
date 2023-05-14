module ApiErrors
  class ExternalApiError < StandardError
    attr_reader :status, :message, :code

    def initialize(status, message, code)
      @status = status
      @message = message
      @code = code
      super("#{status}: #{message}")
    end
  end
end
