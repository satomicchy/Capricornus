class Custom < ActiveRecord::Base
  belongs_to :company

  has_many :invoices
  has_many :estimates

  validates :name, :company_id, presence: true
end
