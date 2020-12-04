class SubscriptionsController < ApplicationController

  before_action :set_broadcast, only: [:create]

	def create
    @subscription = @broadcast.subscriptions.build subscription_params
  
    if @subscription.save
      render json: @subscription, status: 201
    else
      render json: @subscription.errors, status: 400
    end
	end

  private

    def set_broadcast
      @broadcast = Broadcast.find(params[:broadcast_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subscription_params
      params.require(:subscription).permit(:email, :first_name, :last_name, :registration_ip)
    end
end
