class Cost < ActiveRecord::Base
  belongs_to :journal
  has_one :invoice, through: :journal

  delegate :payment, to: :invoice, allow_nil: true
  validates :payment, exclusion: {in: [true]}

  UNIT_TYPE = ['ninku', 'dai']

  after_save do
    journal.invoice.update_summary if journal.invoice_id.present?
  end
end
