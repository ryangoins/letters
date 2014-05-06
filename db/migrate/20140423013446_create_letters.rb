class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.string :recipient_first_name
      t.string :recipient_last_name
      t.string :recipient_street
      t.string :recipient_city
      t.string :recipient_state
      t.integer :recipient_zip
      t.text :content

      t.timestamps
    end
  end
end
