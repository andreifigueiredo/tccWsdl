class DonoExcecao < ApplicationRecord
  belongs_to :developer, optional: true
  belongs_to :excecao
  
  before_validation :update_created_at

  enum evaluate: {
    very_easy: 0,  
    easy: 1,
    medium: 2,
    hard: 3,
    very_hard: 4
  }

  def update_created_at
    if self.developer_id_changed?
      self.created_at = Time.now
    end
  end
end
