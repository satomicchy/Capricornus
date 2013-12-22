class Invoice < ActiveRecord::Base
  has_many :journals, :dependent => :destroy
  has_many :costs, through: :journals
  belongs_to :custom

  validates :ask_on, :deadline, :custom_id, presence: true

  scope :unfinished_payment, ->(){ where("cancel IS NULL OR cancel = ?", false).where("payment IS NULL OR payment = ?", false) }

  def update_summary
    summary = costs.map{|c| c.count * c.unit_price}.inject(:+)
    update_attributes(summary: summary)
  end
end
