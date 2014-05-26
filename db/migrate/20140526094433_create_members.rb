class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.integer :user_id
      t.integer :company_id
      t.boolean :president

      t.timestamps
    end
  end
end
