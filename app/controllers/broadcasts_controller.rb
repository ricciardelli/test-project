class BroadcastsController < ApplicationController

  before_action :set_broadcast, only: :show

  def index
    render json: Broadcast::all
  end

  def show
  	render json: @broadcast
  end

  private

    def set_broadcast
      @broadcast = Broadcast::find(params[:id])
    end

end
