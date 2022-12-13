class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.boolean :menstruator
      t.string :meds_list
      t.string :triggers_list
      t.string :symptoms_list

      t.timestamps
    end
    add_index :users, :email, unique: true
  end
end
