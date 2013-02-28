class CreateBookkeeperAccounts < ActiveRecord::Migration
  def change
    create_table :bookkeeper_accounts do |t|
      t.string    :title, nil: false
      t.decimal   :initial_balance, precision: 8, scale: 2, default: 0
      t.decimal   :balance, precision: 8, scale: 2, nil: false
      t.datetime  :start_date
      t.datetime  :end_date
      t.timestamps
    end
    add_index :bookkeeper_accounts, :title
  end
end

