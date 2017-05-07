class Employee < ApplicationRecord
   belongs_to :department
   has_many :rental_histories
end
