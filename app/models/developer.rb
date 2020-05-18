class Developer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  belongs_to :team, optional: true
  
  has_many :dono_excecaos
  
  before_validation :default_admin,  if: -> {self.admin.nil?}

  def ownered_count
    count = 0
    self.dono_excecaos.each do |dono_excecao|
      unless dono_excecao.solved
        count = count+1
      end
    end
    count
  end
  def solved_count
    count = 0
    self.dono_excecaos.each do |dono_excecao|
      if dono_excecao.solved
        count = count+1
      end
    end
    count
  end

  private

    def default_admin
      self.admin = true
    end

end
