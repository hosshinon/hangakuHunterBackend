class Api::V1::ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:discounts).where.not(discounts: { id: nil }).all
    render json: @shops
  end

  def create
    @shop = Shop.new(shop_params)
    # すでに存在するかチェック
    if Shop.exists?(place_id: @shop.place_id)
      head :ok # 既に存在する場合はステータスコード200を返す
      return
    end
    if @shop.save
      render json: @shop, status: :created
    else
      render json: @shop.errors, status: :unprocessable_entity
    end
  end

  private

    def shop_params
      params.require(:shop).permit(:place_id,
                                   :name,
                                   :rating,
                                   :user_ratings_total,
                                   :formatted_address,
                                   :international_phoneNumber,
                                   :website)
    end
end
