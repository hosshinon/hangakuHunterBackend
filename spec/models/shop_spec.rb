require "rails_helper"

RSpec.describe Shop, type: :model do
  describe "バリデーション" do
    it "nameが必須であること" do
      shop = build(:shop, name: nil)
      expect(shop).not_to be_valid
      expect(shop.errors[:name]).to include("can't be blank")
    end

    it "ratingが0以上100以下であること" do
      shop = build(:shop, rating: -1)
      expect(shop).not_to be_valid
      expect(shop.errors[:rating]).to include("must be greater than or equal to 0")

      shop = build(:shop, rating: 101)
      expect(shop).not_to be_valid
      expect(shop.errors[:rating]).to include("must be less than or equal to 100")
    end

    it "place_idが必須であること" do
      shop = build(:shop, place_id: nil)
      expect(shop).not_to be_valid
      expect(shop.errors[:place_id]).to include("can't be blank")
    end

    it "formatted_addressが必須であること" do
      shop = build(:shop, formatted_address: nil)
      expect(shop).not_to be_valid
      expect(shop.errors[:formatted_address]).to include("can't be blank")
    end

    it "international_phone_numberが必須であること" do
      shop = build(:shop, international_phone_number: nil)
      expect(shop).not_to be_valid
      expect(shop.errors[:international_phone_number]).to include("can't be blank")
    end

    it "websiteが必須であること" do
      shop = build(:shop, website: nil)
      expect(shop).not_to be_valid
      expect(shop.errors[:website]).to include("can't be blank")
    end
  end
end
