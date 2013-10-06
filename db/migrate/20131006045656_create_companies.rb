class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.string :tel
      t.string :fax
      t.string :president
      t.string :zip
      t.string :email

      t.timestamps
    end
  end
end
