FactoryBot.define do
  factory :task do
    name { "MyString" }
    description { "MyText" }
    completed_at { "2019-01-15 13:57:04" }
    is_live { false }
  end
end
