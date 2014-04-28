class Subscription < ActiveRecord::Base
  has_many :positions
  has_many :subscriptions, :through => :positions
end
