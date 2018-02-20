class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
  
    create_table :instruments do |t|
      t.text :name, null: false
      t.jsonb :content, null: false, default: '{}'
      t.timestamps
    end

    add_index :instruments, :content, using: :gin
    add_index :instruments, :name, unique: true
  end
end
