require "rails_helper"

RSpec.describe Discount, type: :model do
  describe "バリデーション" do
    it "shop_idが必須であること" do
      discount = build(:discount, shop_id: nil)
      expect(discount).not_to be_valid
      expect(discount.errors[:shop_id]).to include("can't be blank")
    end

    it "titleが必須であること" do
      discount = build(:discount, title: nil)
      expect(discount).not_to be_valid
      expect(discount.errors[:title]).to include("can't be blank")
    end

    it "start_timeが必須であること" do
      discount = build(:discount, start_time: nil)
      expect(discount).not_to be_valid
      expect(discount.errors[:start_time]).to include("can't be blank")
    end

    it "end_timeが必須であること" do
      discount = build(:discount, end_time: nil)
      expect(discount).not_to be_valid
      expect(discount.errors[:end_time]).to include("can't be blank")
    end

    it "discount_rateが必須であること" do
      discount = build(:discount, discount_rate: nil)
      expect(discount).not_to be_valid
      expect(discount.errors[:discount_rate]).to include("can't be blank")
    end

    it "discount_rateが0以上100以下であること" do
      discount = build(:discount, discount_rate: -1)
      expect(discount).not_to be_valid
      expect(discount.errors[:discount_rate]).to include("must be greater than or equal to 0")

      discount = build(:discount, discount_rate: 101)
      expect(discount).not_to be_valid
      expect(discount.errors[:discount_rate]).to include("must be less than or equal to 100")
    end

    it "descriptionが255文字以内であること" do
      discount = build(:discount, description: "a" * 256)
      expect(discount).not_to be_valid
      expect(discount.errors[:description]).to include("is too long (maximum is 255 characters)")
    end

    it "end_timeがstart_timeより後であること" do
      discount = build(:discount, start_time: Time.current, end_time: Time.current - 1.day)
      expect(discount).not_to be_valid
      expect(discount.errors[:end_time]).to include("はスタートタイムより後でなければなりません")
    end
  end

  describe "アソシエーション" do
    it "shopモデルと関連付けられていること" do
      expect(Discount.reflect_on_association(:shop)).to be_a(ActiveRecord::Reflection::AssociationReflection)
    end
  end
end
