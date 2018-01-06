class AddNameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column    :users, :name,      :string, null: false
    add_column    :users, :body,      :text
    add_column    :users, :image,     :string
    add_column    :users, :team_name, :string, null: false
    add_column    :users, :result,    :text
    add_reference :users, :category, null: false, foreign_key: true
  end
end
