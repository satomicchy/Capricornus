class Invoice < ActiveRecord::Base
  has_many :journals
  has_many :costs, through: :journals
  belongs_to :custom

  validates :ask_on, :deadline, :custom_id, presence: true

  scope :unfinished_payment, ->(){ where("payment IS NOT ?", true) }

  def update_summary
    summary = costs.map{|c| c.count * c.unit_price}.inject(:+)
    update_attributes(summary: summary)
  end
end
