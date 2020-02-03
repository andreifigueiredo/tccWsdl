FactoryBot.define do
  factory :team do
    name { "MyString" }
    association :project
  end
end
