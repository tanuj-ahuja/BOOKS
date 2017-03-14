class AddPriceToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :price, :string
  end
end
