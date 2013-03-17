class AddDateToMovements < ActiveRecord::Migration
  def change
    add_column :bookkeeper_movements, :date, :date, nil: false
  end
end
