class CreateUsers < ActiveRecord::Migration[5.1]
  def change
   # enable_extension 'citext'

    create_table :users do |t|
      t.text :username, null: false
      t.text :firstname, null: false
      t.text :lastname, null: false
      t.timestamps
      t.jsonb :preferences, null: false, default: '{}'
    end

    add_index  :users, :preferences, using: :gin
    add_index :instruments, :username, unique: true
  end
end
