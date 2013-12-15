class AddAccountholderColumnToBank < ActiveRecord::Migration
  def change
    add_column :banks, :account_holder, :string
  end
end
