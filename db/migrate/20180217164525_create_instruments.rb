class CreateInstruments < ActiveRecord::Migration[5.1]
  def change
   # enable_extension 'citext'

    create_table :instruments do |t|
      t.text :name, null: false
      t.jsonb :content, null: false, default: '{}'
    end

    add_index  :instruments, :content, using: :gin
   
  end
end
