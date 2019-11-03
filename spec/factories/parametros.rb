FactoryBot.define do
  factory :parametro do
    param_tipo { "MyString" }
    param_nome { "MyString" }
    requisicao { nil }
  end
end
