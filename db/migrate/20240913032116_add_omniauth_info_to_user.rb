class AddOmniauthInfoToUser < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :provider, :integer, default: 0, null: true
    add_column :users, :provider_user_id, :string, default: "", null: true
    add_column :users, :provider_verified_email, :boolean, default: false, null: true
  end
end
