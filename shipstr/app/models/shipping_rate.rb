class ShippingRate < ApplicationRecord

    belongs_to :shipping_service_provider, class_name: 'ShippingServiceProvider', foreign_key: 'shipping_service_provider_id'

    validates :rate_cents, presence: true
    validates :currency, presence: true
    validates :origin, presence: true
    validates :destination, presence: true

    monetize :rate_cents, with_model_currency: :currency
    monetize :common_rate_cents, with_model_currency: :usd

    before_save :calculate_common_rate

    def calculate_common_rate
      common_cents = rate.exchange_to("USD").cents
      # ^ I promise that wasn't supposed to be a pun.
      self.common_rate_cents = common_cents
    end

    def native_rate
        return rate.format(with_currency: true)
    end

    def common_usd_rate
        return common_rate.format(with_currency: true)
    end

end
