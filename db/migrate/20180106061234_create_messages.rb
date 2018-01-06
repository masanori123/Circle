class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.text   :body
      t.integer :group_id, null: false, freign_key: true
      t.integer :user_id, null: false, freign_key: true
      t.timestamps
    end
  end
end
