class BroadcastsController < ApplicationController
	
  def index
    render json: Broadcast::all
	end

end
