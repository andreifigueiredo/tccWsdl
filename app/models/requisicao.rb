class Requisicao < ApplicationRecord
  belongs_to :acao
  has_one :http
  has_many :parametros
  has_one :sessao
end
