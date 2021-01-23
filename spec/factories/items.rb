FactoryBot.define do
  factory :item do
    title {Faker}
    text {}
    category_id {}
    condition_id {}
    delivery_fee_id {}
    prefecture_id {}
    days_to_ship_id {}
    price {}
  end
end
