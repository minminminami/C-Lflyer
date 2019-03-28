class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, length: {maximum: 30}, format: {with: VALID_EMAIL_REGEX}
  validates :name, presence: true, uniqueness: true, length: {maximum: 50}
  has_secure_password

  def posts
    return Post.where(user_id: self.id)
  end
end
