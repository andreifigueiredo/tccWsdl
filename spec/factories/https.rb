FactoryBot.define do
  factory :http do
    view_referer { Faker::TvShows::SouthPark.quote }
    view_url { "www.example.com" }
    view_method { "Post" }
  end
end
