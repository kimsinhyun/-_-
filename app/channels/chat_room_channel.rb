# frozen_string_literal: true

class ChatRoomChannel < ApplicationCable::Channel
  state_attr_accessor :current_chat_room
  def subscribed
    self.current_chat_room = ChatRoom.find(params[:chat_room_id])
    self.current_chat_room.user_count += 1
    stream_for self.current_chat_room
  end

  def unsubscribed
    self.current_chat_room.user_count -= 1
  end
end
