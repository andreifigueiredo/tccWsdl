FactoryBot.define do
  factory :acao do
    nome { Faker::TvShows::SouthPark.character }
    classe { Faker::Games::Witcher.school }
  end
end