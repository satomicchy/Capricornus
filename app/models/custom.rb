class Custom < ActiveRecord::Base
  has_many :invoices
  has_many :estimates
end
