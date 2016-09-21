class AddBigIntToProjects < ActiveRecord::Migration[5.0]
  def change
    add_column :projects, :amount, :bigint
  end
end
