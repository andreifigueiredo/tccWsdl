class Sessao < ApplicationRecord
  belongs_to :excecao
  has_one :obj_sessao
end
