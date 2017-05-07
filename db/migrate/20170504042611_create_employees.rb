class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :no
      t.string :name
      t.integer :department_id

      t.timestamps
    end
  end
end
