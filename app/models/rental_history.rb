class RentalHistory < ApplicationRecord
   validates :book_id, presence: true
   validates :employee_id, presence: true
   belongs_to :book
   belongs_to :employee
end
