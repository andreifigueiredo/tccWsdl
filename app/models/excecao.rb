class Excecao < ApplicationRecord
  belongs_to :acao, optional: true
  belongs_to :project
end
