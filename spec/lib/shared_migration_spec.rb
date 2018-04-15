# frozen_string_literal: true

require_relative '../../lib/shared_migration'

# Test harness for Shared Migration module
class SharedMigrate < ActiveRecord::Migration[5.2]
  include SharedMigration
end

RSpec.describe SharedMigration do
  let(:subject) { SharedMigrate.new }
  
  describe '#create_name_table' do
    context "when name missing" do
      it { expect { subject.create_name_table(table_name: '') }.to raise_error(MissingTableNameException) }
    end
    
    context "when valid" do
      it do 
        begin  
          expect { subject.create_name_table(table_name: 'test') }.not_to raise_error
        ensure
          subject.drop_table :test
        end
      end
    end
  end

  describe '#add_discard' do
    context "when name missing" do
      it { expect { subject.add_discard(table_name: '') }.to raise_error(MissingTableNameException) }
    end
    
    context "when valid" do
      it do 
        begin  
          subject.create_name_table(table_name: 'test')
          expect { subject.add_discard(table_name: 'test') }.not_to raise_error
        ensure
          subject.drop_table :test
        end
      end
    end
  end
end
