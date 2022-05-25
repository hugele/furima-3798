FactoryBot.define do
  factory :user do

    nickname              {"aaaa"}
    email                 { Faker::Internet.free_email }
    password              {"1qazzxsw"}
    password_confirmation { password }
    first_name            {"太郎"}
    last_name              {"山田"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birthday              {"1999-1-1"}
  end
end