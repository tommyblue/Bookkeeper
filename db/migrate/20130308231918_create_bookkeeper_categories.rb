class CreateBookkeeperCategories < ActiveRecord::Migration
  def change
    create_table :bookkeeper_categories do |t|
      t.references :categorizable, polymorphic: true, nil: false
      t.string :name, uniq: true, nil: false
      t.timestamps
    end
  end
end
