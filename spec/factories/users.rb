FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { "test0000TEST" }
    password_confirmation { password }
    first_name            { "鈴木" }
    last_name             { "太郎" }
    first_name_kana       { "スズキ" }
    last_name_kana        { "タロウ" }
    birthday              { Faker::Date.backward }
  end
end
