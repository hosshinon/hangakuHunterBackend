require "rails_helper"

RSpec.describe Discount, type: :model do
  describe "validations" do
    let(:discount) { build(:discount) }

    it "有効な属性を持つ場合に有効である" do
      expect(discount).to be_valid
    end

    it "shop_idがない場合に無効である" do
      discount.shop_id = nil
      expect(discount).not_to be_valid
      expect(discount.errors.full_messages).to include("Shop can't be blank")
    end

    # タイトルがない場合に無効であること
    it "is invalid without a title" do
      discount.title = nil
      expect(discount).not_to be_valid
      expect(discount.errors.full_messages).to include("Title can't be blank")
    end

    # 割引率が0未満の場合に無効であること
    it "is invalid with a discount rate less than 0" do
      discount.discount_rate = -1
      expect(discount).not_to be_valid
      expect(discount.errors.full_messages).to include("Discount rate must be greater than or equal to 0")
    end

    # 割引率が100を超える場合に無効であること
    it "is invalid with a discount rate greater than 100" do
      discount.discount_rate = 101
      expect(discount).not_to be_valid
      expect(discount.errors.full_messages).to include("Discount rate must be less than or equal to 100")
    end

    # 説明が長すぎる場合に無効であること
    it "is invalid with a too long description" do
      discount.description = "a" * 256
      expect(discount).not_to be_valid
      expect(discount.errors.full_messages).to include("Description is too long (maximum is 255 characters)")
    end
  end
end
