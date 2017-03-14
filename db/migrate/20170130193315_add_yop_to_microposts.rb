class AddYopToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :yop, :string
  end
end
