class CreateChats < ActiveRecord::Migration[7.2]
  def change
    create_table :chats do |t|
      t.references :user, null: false
      t.text :content

      t.timestamps
    end
  end
end
