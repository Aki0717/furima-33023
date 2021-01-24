FactoryBot.define do
  factory :item do
    title              {Faker::Lorem.sentence}
    text               {Faker::Lorem.sentence}
    category_id        {Faker::Number.within(range: 2..11)}
    condition_id       {Faker::Number.within(range: 2..7)}
    delivery_fee_id    {Faker::Number.within(range: 2..3)}
    prefecture_id      {Faker::Number.within(range: 2..48)}
    days_to_ship_id    {Faker::Number.within(range: 2..4)}
    price              {Faker::Number.within(range: 300..9999999)}

    association :user
  end
end
