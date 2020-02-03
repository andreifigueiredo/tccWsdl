class DonoExcecao < ApplicationRecord
  belongs_to :developer, optional: true
  belongs_to :excecao
end
