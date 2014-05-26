class RemovePresidentFromCompany < ActiveRecord::Migration
  def change
    remove_column :companies, :president, :string
  end
end
