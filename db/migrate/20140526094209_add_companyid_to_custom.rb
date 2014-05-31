class AddCompanyidToCustomer < ActiveRecord::Migration
  def change
    add_column :customs, :company_id, :integer
  end
end
