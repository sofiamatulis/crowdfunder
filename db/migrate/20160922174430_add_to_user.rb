class AddToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :oauth_token, :datetime
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :uid, :string
  end
end
