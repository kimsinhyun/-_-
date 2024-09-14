# frozen_string_literal: true

class ChatRoomChannel < Turbo::StreamsChannel
  def subscribed
    super
    if params[:chat_room_id]
      chat_room = ChatRoom.find(params[:chat_room_id])
      chat_room.user_count += 1
      chat_room.save!
    else
      reject
    end
  end

  def unsubscribed
    super
    if params[:chat_room_id]
      chat_room = ChatRoom.find(params[:chat_room_id])
      chat_room.user_count -= 1
      chat_room.save!
      # broadcast_user_count(chat_room)
    end
  end

  private

  def broadcast_user_count(chat_room)
    Turbo::StreamsChannel.broadcast_replace_to(
      "chat_room_#{chat_room.id}",
      target: "user_count",
      partial: "chat_rooms/user_count",
      locals: { chat_room: chat_room }
    )
  end
end
