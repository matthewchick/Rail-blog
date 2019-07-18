class User < ApplicationRecord
  has_many :articles   # 1: many relationship
  before_save { self.email = email.downcase }  # before save to DB, change the email to lowercase
  #https://guides.rubyonrails.org/
  validates :username, presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # rubular.com
  validates :email, presence: true, length: { maximum: 105 },
        uniqueness: { case_sensitive: false },
        format: { with: VALID_EMAIL_REGEX }
  has_secure_password
end
