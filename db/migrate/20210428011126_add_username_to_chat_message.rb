class AddUsernameToChatMessage < ActiveRecord::Migration[6.0]
  def change
    add_column :chat_messages, :username, :string
  end
end
