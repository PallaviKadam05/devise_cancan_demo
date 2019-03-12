class TestMailer < ApplicationMailer

default from: 'notifications@example.com'

  def test_mail
    mail(to: "khannashubham5@gmail.com", subject: 'Your ticket has been updated!')
end
end
