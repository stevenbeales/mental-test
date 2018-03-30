# frozen_string_literal: true

# Table to hold pg_search multi_search models
class CreatePgSearchDocuments < ActiveRecord::Migration[5.1]
  def change
    say_with_time('pg_search multisearch') do
      create_table :pg_search_documents do |t|
        t.text :content
        t.belongs_to :searchable, polymorphic: true, index: true
        t.timestamps null: false
      end
    end
  end
end
