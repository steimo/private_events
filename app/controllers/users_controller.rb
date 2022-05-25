class UsersController < ApplicationController
  before_action :authenticate_user!

  def created_events
    @events = Event.where(creator_id: params[:user_id])
  end
end
