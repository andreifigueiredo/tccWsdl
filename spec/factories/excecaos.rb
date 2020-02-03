FactoryBot.define do
  factory :excecao do
    error { Faker::TvShows::SouthPark.quote }
    project { Project.last}
    association :acao
  end
end
