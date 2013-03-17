class AddDefaultToAccounts < ActiveRecord::Migration
  def change
    add_column :bookkeeper_accounts, :default, :boolean, default: false
    add_index :bookkeeper_accounts, :default
  end
end
