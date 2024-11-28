class SaveDeliveryController < ApplicationController
  before_action :params_delivery, only: [ :create ]

  def create
    @delivery = Request.new(params_delivery)
    if @delivery.save
      render json: @delivery, status: :created
    else
      render json: { message: @delivery.errors.full_messages }, status: :bad_request
    end
  end

  private
    def params_delivery
      params.permit(:trip_id, :sender, :receiver, :address, :size, :weight, :departure_time)
    end
end
