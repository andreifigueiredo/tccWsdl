class Excecao < ApplicationRecord
  belongs_to :acao, optional: true
  belongs_to :project
  
  has_many :parametros
  has_one :dono_excecao
  has_one :http
  has_one :sessao

  after_create :create_dono_excecao
  after_create :send_notification_mail

  def create_dono_excecao 
    DonoExcecao.create(excecao: self)
  end

  def created_at_days
    ((Time.now - self.created_at)/ 1.day).to_i
  end

  def assigned_at_days
    ((Time.now - self.dono_excecao.created_at)/ 1.day).to_i
  end

  def done_at_hours
    ((Time.now - self.dono_excecao.updated_at)/ 1.hour).to_i
  end

  def send_notification_mail
    # self.project.team.developers.each do |developer|
    ExceptionMailer.exception_notification_mail(self.project.team.developers, self).deliver_now
    # end
  end
  
end
