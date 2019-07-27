class ShippingServiceProvider < ApplicationRecord

    monetize :flat_shipping_rate_cents, with_model_currency: :currency

end
