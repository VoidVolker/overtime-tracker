FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Some rationale1 for post' }
    user
  end

  factory :second_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'Some rationale2 for second post' }
    user
  end
end