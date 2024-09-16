# frozen_string_literal: true

class ChatsController < ApplicationController
  before_action :set_chat_room, only: %i[create]

  def create
    @chat = Chat.new(chat_params)
    @chat.user = current_user
    @chat.chat_room = @chat_room

    if @chat.save
      respond_to do |format|
        format.turbo_stream
      end
    else
      render :index, status: :unprocessable_entity
    end
  end

  # def index
  #   @chat_room = ChatRoom.find(params[:chat_room_id])
  #   @pagy, @chats = pagy_countless(@chat_room.chats
  #                                            .includes(user: { profile_image_attachment: :blob })
  #                                            .order(id: :desc), items: 20)
  #
  #   respond_to do |format|
  #     format.html
  #     format.turbo_stream
  #   end
  # end

  private

  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def chat_params
    params.require(:chat).permit(:content)
  end
end
