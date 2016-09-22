class AddDescriptionToRewards < ActiveRecord::Migration[5.0]
  def change
    add_column :rewards, :description, :text
  end
end
