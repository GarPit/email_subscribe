module Admin
  class SubscribersController < ApplicationController
    http_basic_authenticate_with name: "ruby", password: "secret"
    layout 'admin'
    before_action :load_subscriber, except: :index

    def index
      @subscribers = Subscriber.all
      respond_to do |format|
        format.html
        format.json { render json: @subscribers.to_json }
        format.xml { render xml: @subscribers.to_xml }
      end
    end

    def create
      if @subscriber.save
        redirect_to new_subscriber_path
      else
        render :new
      end
    end

    def update
      if @subscriber.update_attributes(subscriber_params)
        redirect_to admin_subscribers_path
      else
        render :edit
      end
    end

    def destroy
      @subscriber.destroy
      redirect_to admin_subscribers_path
    end

    protected

    def subscriber_params
      params.require(:subscriber).permit!
    end

    def load_subscriber
      if params[:id]
        @subscriber = Subscriber.find(params[:id])
      else
        @subscriber = Subscriber.new(subscriber_params)
      end
    end

  end
end
