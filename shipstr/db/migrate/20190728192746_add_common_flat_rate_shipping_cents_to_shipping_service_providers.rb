class AddCommonFlatRateShippingCentsToShippingServiceProviders < ActiveRecord::Migration[5.2]
  def change
    add_column :shipping_service_providers, :common_rate_cents, :integer, :default => 0, :null => false
  end
end
