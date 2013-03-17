class AddStiToMovements < ActiveRecord::Migration
  def change
    add_column :bookkeeper_movements, :type, :string
    add_index :bookkeeper_movements, :type
  end
end
