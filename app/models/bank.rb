class Bank < ActiveRecord::Base
  belongs_to :company

  TYPE = ['futsu', 'touza']
  self.inheritance_column = :_type
end
