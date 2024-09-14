# frozen_string_literal: true

class ChatComponent < ViewComponent::Base
  def initialize(chat:)
    @chat = chat
  end
end
