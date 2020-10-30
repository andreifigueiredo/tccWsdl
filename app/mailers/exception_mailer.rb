class ExceptionMailer < ApplicationMailer
  def exception_notification_mail(developers, excecao)
    to = []
    subject = "New Exception"
    @project = excecao.project.name
    @excecao = excecao

    developers.each do |developer|
      to.push(developer.email)
    end

    # binding.pry
    # mail(to: developers.last.email, subject: subject )
    mail(to: to.map(&:inspect).join(', ').gsub("\"", ""), subject: subject)
  end
end