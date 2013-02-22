class CreateBookkeeperPurchases < ActiveRecord::Migration
  def change
    create_table :bookkeeper_purchases do |t|
      t.string :title
      t.text :description
      t.date :purchase_date
      t.integer :warranty_duration
      t.string :receipt
      t.timestamps
    end
  end
end
