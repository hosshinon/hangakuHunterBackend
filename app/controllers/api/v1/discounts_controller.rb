class Api::V1::DiscountsController < ApplicationController
  # showアクションを追加
  def show
    shop = Shop.find(params[:shop_id])
    discount = shop.discounts.find(params[:id])
    render json: discount
  end

  def create
    shop = Shop.find(params[:shop_id])
    discount = shop.discounts.build(discount_params)

    if discount.save
      render json: discount, status: :created
    else
      render json: discount.errors, status: :unprocessable_entity
    end
  end

  private

    def discount_params
      params.require(:discount).permit(:shop_id, :title, :description, :discount_rate, :start_time, :end_time)
    end
end
