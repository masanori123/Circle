class CreateAnyInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :any_informations do |t|
      t.integer :user_id, null: false, freign_key: true
      t.integer :information_id, null: false, freign_key: true
      t.timestamps
    end
  end
end
