class Member < ActiveRecord::Base
  has_many :users
  has_many :companies

  validates :user_id, :company_id, presence: true
end
