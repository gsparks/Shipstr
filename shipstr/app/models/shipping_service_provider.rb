class ShippingServiceProvider < ApplicationRecord

   # Concern to update the common rate (usd) in the database on save.
   include CurrencyConversionConcern

    has_many :shipping_rates, dependent: :destroy, class_name: 'ShippingRate', foreign_key: 'shipping_service_provider_id'

    validates :company_name, presence: true
    validates :rate_cents, presence: true
    validates :currency, presence: true

    monetize :rate_cents, with_model_currency: :currency
    monetize :common_rate_cents, with_model_currency: :usd

    def native_flat_rate
        return rate.format(with_currency: true)
    end

    def common_flat_rate
        return common_rate.format(with_currency: true)
    end

end
