# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  before_action :set_chat_room, only: %i[show]


  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_messages = @chat_room.chats.includes(:user)
  end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:id])
  end
end
