FactoryBot.define do
  factory :order_address do
    post_code     {"111-1111"}
    prefecture_id {3}
    city          {"神保町"}
    house_number  {"テスと3-3"}
    building_name {"神保アパート222"}
    phone_number  {"09000000000"}
    token         {"tok_abcdefghijk00000000000000000"}
  end
end
