class CreateShippingServiceProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_service_providers do |t|
      t.string :company_name
      t.integer :rate_cents
      t.string :currency

      t.timestamps
    end
  end
end
