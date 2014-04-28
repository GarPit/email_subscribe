class SubscribersController < ApplicationController
  before_action :count_page_views

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    @subscriber.save
  end

  protected

  def subscriber_params
    params.require(:subscriber).permit!
  end

  def count_page_views
    puts "hey"
  end

end
