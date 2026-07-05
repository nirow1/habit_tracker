class CreateHabits < ActiveRecord::Migration[7.1]
  def change
    create_table :habits do |t|
      t.string :name
      t.text :description
      t.string :frequency_type
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
