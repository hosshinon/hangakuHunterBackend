require "rails_helper"

RSpec.describe "Api::V1::Discounts", type: :request do
  let(:shop) { create(:shop) }
  let(:discount) { create(:discount, shop:) }
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/shops/#{shop.id}/discounts/#{discount.id}"
      expect(response).to have_http_status(:success)
    end
  end
end
