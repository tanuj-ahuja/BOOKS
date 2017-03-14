class AddSemToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :sem, :integer
  end
end
