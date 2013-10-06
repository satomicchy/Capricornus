class CreateBanks < ActiveRecord::Migration
  def change
    create_table :banks do |t|
      t.string :name
      t.string :branch
      t.string :type
      t.integer :number

      t.timestamps
    end
  end
end
