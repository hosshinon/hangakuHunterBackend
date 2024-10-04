require "rails_helper"

RSpec.describe "Api::V1::Discounts", type: :request do
  let(:discount) { create(:discount) }
  describe "GET /create" do
    it "returns http success" do
      get "/api/v1/discounts"
      expect(response).to have_http_status(:success)
    end
  end
end
