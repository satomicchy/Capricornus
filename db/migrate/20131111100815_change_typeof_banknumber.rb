class ChangeTypeofBanknumber < ActiveRecord::Migration
  def change
    change_column :banks, :number, :string
  end
end
