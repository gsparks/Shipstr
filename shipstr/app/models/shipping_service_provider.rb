class ShippingServiceProvider < ApplicationRecord

    validates :company_name, presence: true
    validates :flat_shipping_rate_cents, presence: true
    validates :currency, presence: true

    monetize :flat_shipping_rate_cents, with_model_currency: :currency
    monetize :common_flat_shipping_rate_cents, with_model_currency: :usd

    before_save :calculate_common_flat_shipping_rate

    def calculate_common_flat_shipping_rate
      common_cents = flat_shipping_rate.exchange_to("USD").cents
      # ^ I promise that wasn't supposed to be a pun.
      self.common_flat_shipping_rate_cents = common_cents
    end

    def flat_rate
        return flat_shipping_rate.format(with_currency: true)
    end

    def common_flat_rate
        return common_flat_shipping_rate.format(with_currency: true)
    end

end
