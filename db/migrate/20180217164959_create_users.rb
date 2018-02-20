class CreateUsers < ActiveRecord::Migration[5.1]
  def change
  
    create_table :users do |t|
      t.text :username, null: false
      t.text :firstname, null: false
      t.text :lastname, null: false
      t.text :access_token
      t.jsonb :preferences, null: false, default: '{}'
      t.timestamps
    end

    add_index :users, :preferences, using: :gin
    add_index :users, :username, unique: true
  end
end
