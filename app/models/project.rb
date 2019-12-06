class Project < ApplicationRecord
  has_one :team
  has_many :excecaos

end
