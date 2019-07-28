module CurrencyConversionConcern
    extend ActiveSupport::Concern
  
    included do
      before_save :calculate_common_rate
    end
  
    # generic implementation of simple linstener in active record
    def calculate_common_rate
      common_cents = rate.exchange_to("USD").cents
      # ^ I promise that wasn't supposed to be a pun.
      self.common_rate_cents = common_cents
    end

  end