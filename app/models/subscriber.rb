class Subscriber < ActiveRecord::Base
  scope :ids_more_than, lambda {|id| where("id > ?", id) }
  validates :email, presence: true, uniqueness: true, email: true
  validates :name, presence: true, length: {minimum: 5}#, if: lambda {|subscriber| subscriber.email.include?("gmail.com")}

  after_create :send_welcome_email

  has_many :positions
  has_many :subscriptions, :through => :positions


  protected

  def send_welcome_email
    SubscriberMailer.welcome_email(self).deliver
  rescue ArgumentError => e
    puts e.message
  end

end
