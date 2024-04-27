require "rails_helper"

RSpec.describe Discount, type: :model do
  describe "validations" do
    let(:shop) { create(:shop) }
    let(:discount) do
      build(:discount, shop:)
    end

    # 有効な属性を持つ場合に有効であること
    it "is valid with valid attributes" do
      expect(discount).to be_valid
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

    # 終了時間が開始時間より前の場合に無効であること
    it "is invalid with an end time before the start time" do
      discount.end_time = discount.start_time - 1.hour
      expect(discount).not_to be_valid
      expect(discount.errors.full_messages).to include("End time must be greater than #{discount.start_time}")
    end

    # 説明が長すぎる場合に無効であること
    it "is invalid with a too long description" do
      discount.description = "a" * 256
      expect(discount).not_to be_valid
      expect(discount.errors.full_messages).to include("Description is too long (maximum is 255 characters)")
    end
  end
end
