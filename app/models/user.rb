class User < ApplicationRecord
  has_secure_password
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence:true, length: { maximum: 40 }
  validates :first_name, presence:true, length: { maximum: 40 }
  validates :middle_name, allow_nil:true, length: { maximum: 40 }
  validates :last_name, presence:true, length: { maximum: 40 }
end
