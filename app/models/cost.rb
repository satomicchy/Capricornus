class Cost < ActiveRecord::Base
  belongs_to :journal
  has_one :invoice, through: :journal

  delegate :payment, to: :invoice, allow_nil: true
  validates :payment, exclusion: {in: [true]}

  UNIT_TYPE = ['ninku', 'dai']
end
