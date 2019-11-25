class Developer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :project, optional: true

  before_validation :default_admin,  if: -> {self.admin.nil?}


  private

    def default_admin
      self.admin = true
    end
end
