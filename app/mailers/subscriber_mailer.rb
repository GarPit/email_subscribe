class SubscriberMailer < ActionMailer::Base
  default from: "from@example.com"

  def welcome_email(subscriber)
    @subscriber = subscriber
    mail(:to => subscriber.email, :subject => "Добро пожаловать в сервис подписок")
  end
end
