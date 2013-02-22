class CreateBookkeeperPurchases < ActiveRecord::Migration
  def change
    create_table :bookkeeper_purchases do |t|
      t.string    :title,                nil: false
      t.text      :description
      t.date      :purchase_date
      t.integer   :warranty_duration
      t.string    :receipt
      t.timestamps
    end
    add_index :bookkeeper_purchases, :title
  end
end
