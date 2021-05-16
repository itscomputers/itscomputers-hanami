module Ntp::Controllers::Divisibility
  class Index
    include Ntp::Action

    expose :divisor, :dividend

    def call(params)
      @divisor = params[:divisor]&.to_i
      @dividend = params[:dividend]&.to_i
    end
  end
end

