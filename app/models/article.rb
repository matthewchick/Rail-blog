# in Rail4, use class Article < ActiveRecord::Base
# Section 79 validation to control save to db
class Article < ApplicationRecord
  validates :title, presence: true, length: { minimum: 3, maximum:50}
  validates :description, presence: true, length: {minimum: 10, maximum: 300}
end
