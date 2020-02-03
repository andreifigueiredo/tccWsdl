class Excecao < ApplicationRecord
  belongs_to :acao, optional: true
  belongs_to :project
  belongs_to :dono_excecao

  has_many :parametros
  has_one :http
  has_one :sessao

  def initialize 
    super
    self.dono_excecao.create
  end
end
