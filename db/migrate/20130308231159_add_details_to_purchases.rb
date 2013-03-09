class AddDetailsToPurchases < ActiveRecord::Migration
  def up
    add_column :bookkeeper_purchases, :invoice, :boolean, default: false
    add_column :bookkeeper_purchases, :amount, :decimal, precision: 8, scale: 2
  end
end
