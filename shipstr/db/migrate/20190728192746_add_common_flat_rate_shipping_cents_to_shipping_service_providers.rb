class AddCommonFlatRateShippingCentsToShippingServiceProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_service_providers, :common_flat_shipping_rate_cents, :integer
  end
end
