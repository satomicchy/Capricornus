class Journal < ActiveRecord::Base
  has_many   :costs
  belongs_to :user
  belongs_to :invoice
  belongs_to :estimate
  belongs_to :custom

  after_create :connection_to_invoice

  delegate :payment, to: :invoice, allow_nil: true
  validates :payment, exclusion: {in: [true]}

  def self.current_month(date)
    first_time = date.beginning_of_month.to_time
    end_time   = first_time.end_of_month
    Journal.where(start_at: first_time..end_time)
  end

  def connection_to_invoice
    invoice = Invoice.where(custom_id: custom_id).where("? <= ask_on", start_at.to_date).first
    if invoice.present?
      update_attributes(invoice_id: invoice.id)
    else
      ask_on      = Date.new(start_at.year, start_at.month, Company.all.first.close_day)
      new_invoice = Invoice.new(ask_on: ask_on, deadline: ask_on.end_of_month, custom_id: custom_id)
      new_invoice.save
      update_attributes(invoice_id: new_invoice.id)
    end
  end
end
