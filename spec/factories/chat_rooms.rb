# frozen_string_literal: true

FactoryBot.define do
  factory :chat_room do
    title { "MyString" }
    chat_count { 0 }
    user_count { 0 }
  end
end
