FactoryBot.define do
  sequence :rationale do |n|
    "Rationale #{n}"
  end

  factory :post do
    date { Date.today }
    rationale { generate :rationale }
    user
  end
end