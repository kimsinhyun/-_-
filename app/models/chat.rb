# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true
  validates :content, length: { maximum: 1000 }

  after_create_commit :broadcast_create
  # after_destroy_commit :broadcast_destroy


  def broadcast_create
    broadcast_append_to "chat_rooms:#{chat_room.id}:chats",
                        # partial: "messages/message",
                        locals: { chat: self, display_controls: false }
  end
end
