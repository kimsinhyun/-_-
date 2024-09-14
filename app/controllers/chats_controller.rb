# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :set_chat_room, only: %i[show]

  def create
    @chat = Chat.new(chat_params)
    @chat.user = current_user
    @chat.chat_room = @chat_room
    @chat.save!
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def chat_params
    params.require(:chat).permit(:content)
  end
end
