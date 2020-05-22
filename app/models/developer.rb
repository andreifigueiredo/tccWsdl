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

  def idle?
    if (self.ownered_count - self.solved_count) > 0
      I18n.t('negative')
    else
      I18n.t('positive')
    end
  end 

  private

    def default_admin
      self.admin = true
    end

end
