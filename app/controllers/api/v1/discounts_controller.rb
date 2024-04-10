class Api::V1::DiscountsController < ApplicationController
  def create
    shop = Shop.find(params[:shop_id])
    discount = shop.discounts.new(discount_params)

    if discount.save
      render json: discount, status: :created
    else
      render json: discount.errors, status: :unprocessable_entity
    end
  end

  private

    def discount_params
      params.require(:discount).permit(:description, :discount_rate, :start_time, :end_time)
    end
end
