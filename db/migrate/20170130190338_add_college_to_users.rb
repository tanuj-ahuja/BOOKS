class AddCollegeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :college, :string
  end
end
