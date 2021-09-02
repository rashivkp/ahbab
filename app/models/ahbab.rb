class Ahbab < ApplicationRecord
  include Visible
  paginates_per 25
  has_many :payments, dependent: :delete_all

  validates :name, presence: true
  validates :mobile, presence: true, format: {with: /\d{10,15}/}
  validates :address, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }

  def total_payment?
    payments.all.sum
  end
end
