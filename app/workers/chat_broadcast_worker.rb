# frozen_string_literal: true

class ChatBroadcastWorker
  include Turbo::Broadcastable
  include ActionView::RecordIdentifier
  include Sidekiq::Worker

  def perform(chat_id)
    chat = Chat.find(chat_id)
    Turbo::StreamsChannel.broadcast_append_to "chat_room_#{chat.chat_room.id}",
                                              target: "chats",
                                              partial: "chats/chat",
                                              locals: { chat: chat },
                                              data: { id: dom_id(chat) }
  end
end
