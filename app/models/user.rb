class User < ActiveRecord::Base
  has_secure_password
  has_many :quotes, dependent: :destroy
  validates :user_name, presence: true, uniqueness: true
  validates :password_digest, presence: true, length: {minimum: 7}
  validates :display_name, presence: true
end
