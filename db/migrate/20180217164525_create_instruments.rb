class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
   # enable_extension 'citext'

    create_table :instruments do |t|
      t.text :name, null: false
      t.timestamps
      t.jsonb :content, null: false, default: '{}'
    end

    add_index  :instruments, :content, using: :gin
    add_index :instruments, :name, unique: true
   
  end
end
