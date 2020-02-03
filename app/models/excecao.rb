class Excecao < ApplicationRecord
  belongs_to :acao, optional: true
  belongs_to :project
  
  has_many :parametros
  has_one :dono_excecao
  has_one :http
  has_one :sessao

  after_create :create_dono_excecao

  def create_dono_excecao 
    DonoExcecao.create(excecao: self)
  end
end
