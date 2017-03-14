class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
    	t.integer :buyer_id
      t.integer :seller_id
      t.integer :message_id

      t.timestamps
    end
      add_index :relationships, :buyer_id
    add_index :relationships, :seller_id
    add_index :relationships, :message_id
    add_index :relationships, [:buyer_id, :seller_id,:message_id], unique: true
  end
end
