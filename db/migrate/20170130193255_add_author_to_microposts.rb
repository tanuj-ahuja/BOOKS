class AddAuthorToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :author, :string
  end
end
