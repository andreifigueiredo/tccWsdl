class DonoExcecao < ApplicationRecord
  belongs_to :developer, optional: true
  belongs_to :excecao

  enum evaluate: {
    very_easy: 0,  
    easy: 1,
    medium: 2,
    hard: 3,
    very_hard: 4
  }
end
