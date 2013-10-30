class Invoice < ActiveRecord::Base
  has_many :journals
  belongs_to :custom
end
