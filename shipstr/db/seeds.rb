# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

require 'csv'
CSV.foreach(Rails.root.join('db/seeds_data/service_provider_data.csv'), headers: true) do |row|
    ShippingServiceProvider.create({
    id: row[0],
    company_name: row[1],
    rate_cents: (row[2].to_f * 100).to_i,
    currency: row[3]
  })
end

CSV.foreach(Rails.root.join('db/seeds_data/rate_data.csv'), headers: true) do |row|
    ShippingRate.create({
    rate_cents: (row[0].to_f * 100).to_i,
    currency: row[1],
    origin: row[2],
    destination: row[3],
    shipping_service_provider_id: row[4]
  })
end
