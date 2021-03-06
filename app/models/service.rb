class Service < ApplicationRecord
  belongs_to :barber
  validates :barber_id, presence: true
  validates :title, presence: true, length: { maximum: 80 }
  validates :price, presence: true
  attribute :price, :money
end
