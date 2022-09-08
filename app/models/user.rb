class User < ApplicationRecord
  has_many :user_parties
  has_many :parties, through: :user_parties
  validates_presence_of :name, presence: true
  validates_presence_of :email, uniqueness: true, presence: true
  validates :password, presence: true
  has_secure_password
end