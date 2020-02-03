class Excecao < ApplicationRecord
  belongs_to :acao, optional: true
  belongs_to :project

  has_many :parametros
  has_one :http
  has_one :sessao
end
