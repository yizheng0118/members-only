class User < ApplicationRecord
  devise :database_authenticatable, :registerable
  has_many :posts
  validates :email, presence: true
  validates :encrypted_password, presence: true
end
