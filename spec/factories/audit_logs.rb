FactoryBot.define do
  factory :audit_log do
    user { nil }
    status { 1 }
    started { "2021-05-31" }
    ended { "2021-05-31" }
  end
end
