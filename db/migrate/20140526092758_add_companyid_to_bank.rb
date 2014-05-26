class AddCompanyidToBank < ActiveRecord::Migration
  def change
    add_column :banks, :company_id, :integer
  end
end
