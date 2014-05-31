class Estimate < ActiveRecord::Base
  has_many :journals
  belongs_to :customer
end
