require "rails_helper"

RSpec.describe Shop, type: :model do
  describe "validations" do
    it "is valid with valid attributes" do
      shop = build(:shop)
      expect(shop).to be_valid
    end

    it "is invalid without a name" do
      shop = build(:shop, name: nil)
      expect(shop).not_to be_valid
      expect(shop.errors[:name]).to include("can't be blank")
    end

    it "is invalid with an improperly formatted postal code" do
      shop = build(:shop, postal_code: "1234567") # without hyphen
      expect(shop).not_to be_valid
      expect(shop.errors[:postal_code]).to include("is invalid")
    end

    it "is invalid without an address" do
      shop = build(:shop, address: nil)
      expect(shop).not_to be_valid
      expect(shop.errors[:address]).to include("can't be blank")
    end

    it "is invalid with a non-numeric latitude" do
      shop = build(:shop, latitude: "not_a_number")
      expect(shop).not_to be_valid
      expect(shop.errors[:latitude]).to include("is not a number")
    end

    it "is invalid with a non-numeric longitude" do
      shop = build(:shop, longitude: "not_a_number")
      expect(shop).not_to be_valid
      expect(shop.errors[:longitude]).to include("is not a number")
    end
  end
end
