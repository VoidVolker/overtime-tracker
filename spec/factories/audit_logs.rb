FactoryBot.define do
  factory :audit_log do
    user
    # status { 0 }
    # started { Date.today.prev_occurring(:monday) }
    # ended { nil }
  end
end
