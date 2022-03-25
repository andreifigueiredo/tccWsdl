class Project < ApplicationRecord
  has_one :team
  has_many :excecaos

  validates :code, uniqueness: true

  after_create :generate_code, if: -> { self.code.blank? } 

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
    
    if solved_exceptions > 0
      solved_percentage = "#{(self.solved_exceptions.to_f/count)*100}%"
    else
      solved_percentage = "0.0%"
    end

    return solved_percentage  
  end
  
  def assigned_exceptions
    count = 0

    self.excecaos.each do |excecao|
      if excecao.dono_excecao.solved != true && excecao.dono_excecao.developer_id.present?
        puts "dono_excecao", excecao.dono_excecao.id
        count = count + 1
      end
    end

    puts "count", count

    return count
  end
  
  def pending_exceptions
    count = 0
    excecao_count = 0

    self.excecaos.group(:error).count.each do |excecao|
      excecao_count = excecao_count + excecao[1]
    end
    
    count = excecao_count - self.assigned_exceptions - self.solved_exceptions
    
    if count > 0
      return count
    else
      return 0
    end
  end
  
  def developers_count
    if self.team.present?
      return self.team.developers.count
    end
  end

  def generate_code
    code = (0...8).map { (65 + rand(26)).chr }.join

    self.update_attributes(code: code)
  end

end
