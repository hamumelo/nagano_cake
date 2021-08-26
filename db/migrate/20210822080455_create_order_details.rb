class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :price
      t.integer :amount
      t.integer :making_status, default: 0
      t.integer :order_id
      t.integer :item_id
      t.datetime :created_at, default: -> { 'NOW()' }
      t.datetime :updated_at, default: -> { 'NOW()' }

      t.timestamps
    end
  end
end
