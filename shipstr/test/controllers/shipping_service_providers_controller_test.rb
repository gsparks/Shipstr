require 'test_helper'

class ShippingServiceProvidersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @shipping_service_provider = shipping_service_providers(:one)
  end

  test "should get index" do
    get shipping_service_providers_url, as: :json
    assert_response :success
  end

  test "should create shipping_service_provider" do
    assert_difference('ShippingServiceProvider.count') do
      post shipping_service_providers_url, params: { shipping_service_provider: { company_name: @shipping_service_provider.company_name, currency: @shipping_service_provider.currency, flat_shipping_rate_cents: @shipping_service_provider.flat_shipping_rate_cents } }, as: :json
    end

    assert_response 201
  end

  test "should show shipping_service_provider" do
    get shipping_service_provider_url(@shipping_service_provider), as: :json
    assert_response :success
  end

  test "should update shipping_service_provider" do
    patch shipping_service_provider_url(@shipping_service_provider), params: { shipping_service_provider: { company_name: @shipping_service_provider.company_name, currency: @shipping_service_provider.currency, flat_shipping_rate_cents: @shipping_service_provider.flat_shipping_rate_cents } }, as: :json
    assert_response 200
  end

  test "should destroy shipping_service_provider" do
    assert_difference('ShippingServiceProvider.count', -1) do
      delete shipping_service_provider_url(@shipping_service_provider), as: :json
    end

    assert_response 204
  end
end
