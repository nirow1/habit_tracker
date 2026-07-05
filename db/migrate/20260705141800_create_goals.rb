class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.references :habit, null: false, foreign_key: true
      t.string :title
      t.integer :target_value
      t.integer :current_value
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
