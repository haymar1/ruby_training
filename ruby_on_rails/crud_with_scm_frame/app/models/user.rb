class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 }
  validates :password, presence: true
  validates :super_user_flag, presence: true
  validates :phone, presence: true
  validates :address, presence: true
  validates :birthday, presence: true

  has_secure_password

  private

  def email_downcase
    self.email = email.downcase
  end
end
