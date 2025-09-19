FactoryBot.define do
  factory :user do
    nickname              {Faker::Name}
    email                 {Faker::Internet.email}
    password              {"j3" + Faker::Internet.password(min_length: 4)}
    password_confirmation {password}
    first_name            {"やマ田"}
    second_name           {"太ロう"}
    first_name_kana       {"ヤマダ"}
    second_name_kana      {"タロウ"}
    birthday              {Faker::Date.between(from: Date.new(1930, 1, 1), to: 5.years.ago.end_of_year.to_date)}
  end
end