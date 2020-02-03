FactoryBot.define do
  factory :parametro do
    param_tipo { Faker::Games::Witcher.school }
    param_nome { Faker::TvShows::SouthPark.character }
    association :excecao
  end
end
