class Api::V1::DiscountsController < ApplicationController
  def index
    @discounts = Discount.all
    render json: @discounts
  end

  def show
    @discounts = Discount.where(shop_id: params[:id])
    if @discounts.present?
      render json: @discounts
    else
      render json: { error: "この店舗の割引情報が見つかりません" }, status: :not_found
    end
  end

  def create
    @discount = Discount.new(discount_params)
    if @discount.save
      render json: @discount, status: :created
    else
      render json: @discount.errors, status: :unprocessable_entity
    end
  end

  def update
    @discount = Discount.find(params[:id])
    if @discount.update(discount_params)
      render json: @discount
    else
      render json: @discount.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @discount = Discount.find(params[:id])
    if @discount.destroy
      head :no_content
    else
      render json: { error: "割引情報の削除に失敗しました" }, status: :unprocessable_entity
    end
  end

  private

    def discount_params
      params.require(:discount).permit(:shop_id, :title, :description, :discount_rate, :start_time, :end_time)
    end
end
