require 'test_helper'

class ShippingRatesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping_rate = shipping_rates(:one)
  end

  test "should get index" do
    get shipping_rates_url, as: :json
    assert_response :success
  end

  test "should create shipping_rate" do
    assert_difference('ShippingRate.count') do
      post shipping_rates_url, params: { shipping_rate: { belongs_to: @shipping_rate.belongs_to, common_rate_cents: @shipping_rate.common_rate_cents, currency: @shipping_rate.currency, destination: @shipping_rate.destination, origin: @shipping_rate.origin, rate_cents: @shipping_rate.rate_cents } }, as: :json
    end

    assert_response 201
  end

  test "should show shipping_rate" do
    get shipping_rate_url(@shipping_rate), as: :json
    assert_response :success
  end

  test "should update shipping_rate" do
    patch shipping_rate_url(@shipping_rate), params: { shipping_rate: { belongs_to: @shipping_rate.belongs_to, common_rate_cents: @shipping_rate.common_rate_cents, currency: @shipping_rate.currency, destination: @shipping_rate.destination, origin: @shipping_rate.origin, rate_cents: @shipping_rate.rate_cents } }, as: :json
    assert_response 200
  end

  test "should destroy shipping_rate" do
    assert_difference('ShippingRate.count', -1) do
      delete shipping_rate_url(@shipping_rate), as: :json
    end

    assert_response 204
  end
end
