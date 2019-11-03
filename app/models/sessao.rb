class Sessao < ApplicationRecord
  belongs_to :requisicao
  has_one :obj_sessao
end
