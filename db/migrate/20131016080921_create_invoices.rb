class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.string :number
      t.date :ask_on
      t.date :deadline
      t.integer :custom_id
      t.text :memo
      t.integer :summary
      t.boolean :payment
      t.boolean :cancel

      t.timestamps
    end
  end
end
