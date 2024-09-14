class CreateChatRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :chat_rooms do |t|
      t.string :title
      t.integer :chat_count
      t.integer :user_count
      t.timestamps
    end

    add_reference :chats, :chat_room
  end
end
