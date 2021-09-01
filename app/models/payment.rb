class Payment < ApplicationRecord
  belongs_to :ahbab

  validates :amount, presence: true, numericality: { only_integer: true }
  validates :year, presence: true, format: {with: /\d{4}/}
end
