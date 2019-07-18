class User < ApplicationRecord
  #https://guides.rubyonrails.org/
  validates :username, presence: true,
        uniqueness: { case_sensitive: false },
        length: { minimum: 3, maximum: 25 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  # rubular.com
  validates :email, presence: true, length: { maximum: 105 },
        uniqueness: { case_sensitive: false },
        format: { with: VALID_EMAIL_REGEX }

end
