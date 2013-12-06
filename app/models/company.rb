class Company < ActiveRecord::Base
  has_many :users
  has_many :banks

  validates :name, :zip, :address, :tel, :close_day, presence: true
end
