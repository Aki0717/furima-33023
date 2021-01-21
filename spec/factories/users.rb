FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@test.com"}
    password              {"a00000"}
    password_confirmation {password}
    first_name            {"あべ"}
    last_name             {"あべべ"}
    kana_first_name       {"アベ"}
    kana_last_name        {"アベベ"}
    birth_date            {19980717}
  end
end