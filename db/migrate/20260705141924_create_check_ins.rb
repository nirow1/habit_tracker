class CreateCheckIns < ActiveRecord::Migration[7.1]
  def change
    create_table :check_ins do |t|
      t.references :goal, null: false, foreign_key: true
      t.date :date
      t.integer :value
      t.text :note

      t.timestamps
    end
  end
end
