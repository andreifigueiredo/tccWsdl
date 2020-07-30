class Project < ApplicationRecord
  has_one :team
  has_many :excecaos

  before_create :generate_code, if: -> { self.code.blank? } 

  validates :code, uniqueness: true

  
  def solved_exceptions
    count = 0
    
    self.excecaos.each do |excecao|
      if excecao.dono_excecao.solved
        count = count + 1
      end
    end
    
    return count
  end
  
  def done_exceptions
    count = 0    
    
    self.excecaos.group(:error).count.each do |excecao|
      count = count + excecao[1]
    end
    
    solved_percentage = "#{(self.solved_exceptions.to_f/count)*100}%"

    return solved_percentage
  end
  
  def assigned_exceptions
    count = 0

    self.excecaos.each do |excecao|
      if excecao.dono_excecao.developer_id.present?
        count = count + 1
      end
    end

    return count
  end
  
  def pending_exceptions
    count = 0
    excecao_count = 0

    self.excecaos.group(:error).count.each do |excecao|
      excecao_count = excecao_count + excecao[1]
    end
    
    count = excecao_count - self.assigned_exceptions - self.solved_exceptions
    
    return count
  end
  
  def developers_count
    if self.team.present?
      return self.team.developers.count
    end
  end

  private

  def generate_code
    self.code = (0...8).map { (65 + rand(26)).chr }.join
  end
end
