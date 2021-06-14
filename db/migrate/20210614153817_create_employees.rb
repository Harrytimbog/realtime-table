class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :position
      t.string :office
      t.string :extension
      t.date :start_date

      t.timestamps
    end
  end
end
