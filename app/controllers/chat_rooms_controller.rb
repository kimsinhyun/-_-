# frozen_string_literal: true

class ChatRoomsController < ApplicationController
  def index
    @pagy, @chat_rooms = pagy_countless(ChatRoom.all.order(id: :desc), items: 20, page: params[:page])

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    # @chat_room = ChatRoom.includes(chats: { user: { profile_image_attachment: :blob } }).find(params[:id])
    @chat_room = ChatRoom.find(params[:id])
    @pagy, @chats = pagy_countless(@chat_room.chats
                       .includes(user: { profile_image_attachment: :blob })
                       .order(id: :desc), items: 20)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end
end
