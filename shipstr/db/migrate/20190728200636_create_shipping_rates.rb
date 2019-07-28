class CreateShippingRates < ActiveRecord::Migration[5.2]
  def change
    create_table :shipping_rates do |t|
      t.integer :rate_cents
      t.string :currency
      t.integer :common_rate_cents, :default => 0, :null => false
      t.string :origin
      t.string :destination
      t.integer :shipping_service_provider_id, :index => true, :foreign_key => true

      t.timestamps
    end
  end
end
