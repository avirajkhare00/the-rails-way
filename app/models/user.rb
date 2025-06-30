class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :username, :email, :password, presence: true
end
