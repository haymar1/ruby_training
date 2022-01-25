class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true, on: :create, length: { minimum: 8 }
  validates :password, confirmation: true, on: :update
  validates :phone, presence: true
  validates :address, presence: true
  validates :birthday, presence: true
  has_secure_password

  private
end
