class Developer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :team, optional: true
  belongs_to :dono_excecao, optional: true

  before_validation :default_admin,  if: -> {self.admin.nil?}


  private

    def default_admin
      self.admin = true
    end
end
