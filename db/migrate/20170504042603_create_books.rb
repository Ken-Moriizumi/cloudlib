class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :isbn
      t.string :asin
      t.string :publisher
      t.string :creater

      t.timestamps
    end
  end
end
