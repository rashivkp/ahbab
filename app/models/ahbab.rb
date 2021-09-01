class Ahbab < ApplicationRecord
  include Visible
  has_many :payments

  validates :name, presence: true
  validates :address, presence: true
  validates :amount, presence: true

  def total_payment?
    payments.all.sum
  end
end
