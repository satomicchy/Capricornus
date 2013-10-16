class CreateJournals < ActiveRecord::Migration
  def change
    create_table :journals do |t|
      t.datetime :work_on
      t.text :content
      t.string :city
      t.integer :custom_id
      t.boolean :travel_expenses
      t.boolean :complete
      t.integer :invoice_id
      t.integer :user_id

      t.timestamps
    end
  end
end
