class Bank < ActiveRecord::Base
  belongs_to :company

  TYPE = ['futsu', 'touza']
  self.inheritance_column = :_type

  validates :name, :branch, :type, :number, :account_holder, :company_id, presence: true
end
