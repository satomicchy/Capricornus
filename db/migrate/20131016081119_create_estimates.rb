class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.string :number
      t.string :title
      t.date :deadline
      t.string :requirement
      t.integer :custom_id
      t.text :memo
      t.integer :summary

      t.timestamps
    end
  end
end
