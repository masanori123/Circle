class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.text :text
      t.integer :user_id, null: false, freign_key: true
      t.timestamps
    end
  end
end
