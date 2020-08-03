class Barber < ApplicationRecord
  validates :name, presence: true, length: { maximum: 100 }
  validates :last_name, presence: true, length: { maximum: 40 }
  validates :role, presence: true, length: { maximum: 50 }
  validates :image, presence: true, length: { minimum: 2 }
  has_many :services, dependent: :destroy
  has_many :appointments, dependent: :destroy
end
