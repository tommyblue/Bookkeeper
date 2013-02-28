class CreateBookkeeperMovements < ActiveRecord::Migration
  def change
    create_table :bookkeeper_movements do |t|
      t.integer   :account_id, nil: false
      t.decimal   :amount, precision: 8, scale: 2, nil: false
      t.string    :description, nil: false
      t.timestamps
    end
    add_index :bookkeeper_movements, :account_id
    add_index :bookkeeper_movements, :amount
    add_index :bookkeeper_movements, :description
  end
end

