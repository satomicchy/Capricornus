class CreateCosts < ActiveRecord::Migration
  def change
    create_table :costs do |t|
      t.integer :count
      t.string :unit
      t.integer :unit_price
      t.integer :journal_id

      t.timestamps
    end
  end
end
