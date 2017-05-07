class Book < ApplicationRecord
  validates :isbn, presence: true
  validates :isbn, uniqueness: true
  has_many :rental_histories
end
