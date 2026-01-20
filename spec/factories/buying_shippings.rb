FactoryBot.define do
  factory :buying_shipping do
    postcode { Faker::Number.leading_zero_number(digits: 3) + '-' + Faker::Number.leading_zero_number(digits: 4) }
    area_id  { Faker::Number.between(from: 2, to: 48) }
    city     { Faker::Address.city }
    address  { Faker::Address.street_address }
    building { Faker::Address.community + %w[ビル ハイツ マンション レジデンス].sample + Faker::Number.between(from: 101, to: 999) }
    phone    { Faker::Number.leading_zero_number(digits: 11) }
    token    { "tok_test_abcdefghijk000000000000" }
  end
end
