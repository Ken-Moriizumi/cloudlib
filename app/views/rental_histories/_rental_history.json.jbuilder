json.extract! rental_history, :id, :book_id, :employee_id, :borrow_date, :return_date, :created_at, :updated_at
json.url rental_history_url(rental_history, format: :json)
