class CreateMigraines < ActiveRecord::Migration[7.0]
  def change
    create_table :migraines do |t|
      t.datetime :migraine_date
      t.string :severity
      t.text :notes
      t.text :medications, default: "None", null: false
      t.text :symptoms, default: "None", null: false
      t.text :triggers, default: "None", null: false
      t.references :user, foreign_key: true
      
      t.timestamps
    end
  end
end
