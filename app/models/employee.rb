class Employee < ApplicationRecord
   validates :no, presence: true
   validates :no, uniqueness: true
   validates :name, presence: true
   belongs_to :department
   has_many :rental_histories
end
