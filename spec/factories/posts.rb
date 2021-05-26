FactoryBot.define do
  factory :post do
    date { Date.today }
    rationale { 'Some rationale for post' }
    user_id { 1 }
  end

  factory :second_post, class: 'Post' do
    date { Date.yesterday }
    rationale { 'Some rationale for second post' }
    user_id { 1 }
  end
end