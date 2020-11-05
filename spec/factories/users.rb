FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"山田"}
    family_name           {"太郎"}
    first_name_kana       {"ヤマダ"}
    family_name_kana      {"タロウ"}
    birthday              {Faker::Date.in_date_period}
  end
end
