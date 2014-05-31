class Company < ActiveRecord::Base
  has_many :members
  has_many :users, through: :members
  has_many :banks
  has_many :customers

  validates :name, :zip, :address, :tel, :close_day, presence: true
end
