class Journal < ActiveRecord::Base
  has_many   :cost
  belongs_to :user
  belongs_to :invoice
  belongs_to :estimate
  belongs_to :custom

  def self.current_month(date)
    first_time = date.beginning_of_month.to_time
    end_time   = first_time.end_of_month
    Journal.where(start_at: first_time..end_time)
  end
end
