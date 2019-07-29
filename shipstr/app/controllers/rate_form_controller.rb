class RateFormController < ActionController::Base
  def index
    @shipping_service_providers = ShippingServiceProvider.all
    render 'index'
  end
end
