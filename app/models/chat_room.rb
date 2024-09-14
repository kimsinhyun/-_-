# frozen_string_literal: true

class ChatRoom < ApplicationRecord
  has_many :chats, dependent: :destroy
end
