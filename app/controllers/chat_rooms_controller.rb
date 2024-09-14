# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def show
    @chat_room = ChatRoom.includes(chats: { user: { profile_image_attachment: :blob } }).find(params[:id])
  end
end
