class ShippingRate < ApplicationRecord
    
    # Concern to update the common rate (usd) before save.
    include CurrencyConversionConcern

    belongs_to :shipping_service_provider, class_name: 'ShippingServiceProvider', foreign_key: 'shipping_service_provider_id'

    validates :rate_cents, presence: true
    validates :currency, presence: true
    validates :origin, presence: true
    validates :destination, presence: true

    monetize :rate_cents, with_model_currency: :currency
    monetize :common_rate_cents, with_model_currency: :usd

    def native_kilo_rate
        return rate.format(with_currency: true)
    end

    def common_kilo_rate
        return common_rate.format(with_currency: true)
    end

end
