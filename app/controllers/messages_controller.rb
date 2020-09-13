class MessagesController < ApplicationController
  before_action :authenticate_user!
  def create
    room = Room.find(params[:room_id])
    message = current_user.messages.new(message_params)
    message.room = room
    redirect_to room_path(room) if message.save
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
