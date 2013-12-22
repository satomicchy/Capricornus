class Journal < ActiveRecord::Base
  has_many   :costs, :dependent => :destroy
  belongs_to :user
  belongs_to :invoice
  belongs_to :estimate
  belongs_to :custom

  before_save :correct_period?
  after_save  :connection_to_invoice, if: -> { !done_connection_to_invoice }

  delegate :payment, to: :invoice, allow_nil: true
  validates :payment, exclusion: {in: [true]}
  validates :start_at, :finish_at, :custom_id, presence: true

  attr_accessor :done_connection_to_invoice

  def self.current_month(date)
    first_time = date.beginning_of_month.to_time
    end_time   = first_time.end_of_month
    Journal.where(start_at: first_time..end_time)
  end

  def connection_to_invoice
    self.done_connection_to_invoice = true
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

  def correct_period?
    if start_at >= finish_at
      errors.add("start_at", "が終業時刻より遅い時間に設定されています。")
      return false
    end
  end
end
