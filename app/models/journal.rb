class Journal < ActiveRecord::Base
  has_many   :cost
  belongs_to :user
  belongs_to :invoice
  belongs_to :estimate
  belongs_to :custom
end
