class CreateRentalHistories < ActiveRecord::Migration[5.1]
  def change
    create_table :rental_histories do |t|
      t.integer :book_id
      t.integer :employee_id
      t.date :borrow_date
      t.date :return_date

      t.timestamps
    end
  end
end
