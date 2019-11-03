FactoryBot.define do
  factory :http do
    view_referer { "MyText" }
    view_url { "MyText" }
    view_method { "MyText" }
    references { "" }
  end
end
