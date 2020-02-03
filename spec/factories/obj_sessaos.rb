FactoryBot.define do
  factory :obj_sessao do
    obj_text { Faker::TvShows::SouthPark.quote }
    association :sessao
  end
end
