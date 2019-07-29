class ShippingServiceProvidersController < ApplicationController
  before_action :set_shipping_service_provider, only: [:show, :update, :destroy]

  # GET /shipping_service_providers
  def index
    @shipping_service_providers = ShippingServiceProvider.all

    render json: @shipping_service_providers
  end

  # GET /shipping_service_providers/1
  def show
    render json: @shipping_service_provider
  end

  # POST /shipping_service_providers
  def create
    @shipping_service_provider = ShippingServiceProvider.new(shipping_service_provider_params)

    if @shipping_service_provider.save
      render json: @shipping_service_provider, status: :created, location: @shipping_service_provider
    else
      render json: @shipping_service_provider.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shipping_service_providers/1
  def update
    if @shipping_service_provider.update(shipping_service_provider_params)
      render json: @shipping_service_provider
    else
      render json: @shipping_service_provider.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shipping_service_providers/1
  def destroy
    @shipping_service_provider.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shipping_service_provider
      @shipping_service_provider = ShippingServiceProvider.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def shipping_service_provider_params
      params.require(:shipping_service_provider).permit(:company_name, :rate_cents, :currency)
    end
end
