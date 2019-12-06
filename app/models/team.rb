class Team < ApplicationRecord
  belongs_to :project
  has_many :developers
end
