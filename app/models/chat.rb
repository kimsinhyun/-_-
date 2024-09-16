# frozen_string_literal: true

class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :content, presence: true
  validates :content, length: { maximum: 1000 }

  after_create_commit :broadcast_create


  def broadcast_create
    ChatBroadcastWorker.new.perform(self.id)
    # ChatBroadcastWorker.perform_async(self.id)
  end
end
