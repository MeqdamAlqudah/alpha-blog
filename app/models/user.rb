class User < ApplicationRecord
  has_secure_password
  before_save { self.email = email.downcase }

  has_many :articles

  validates :email,
            uniqueness: { case_sensitive: false },
            presence: true, length: { maximum: 80 },
            format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :username,
            uniqueness: { case_sensitive: false },
            presence: true, length: { maximum: 50 }
end
