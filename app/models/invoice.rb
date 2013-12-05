class Invoice < ActiveRecord::Base
  has_many :journals
  has_many :costs, through: :journals
  belongs_to :custom

  scope :unfinished_payment, ->(){ where("payment IS NOT ?", true) }
end
