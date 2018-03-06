# frozen_string_literal: true

RSpec.describe Project, type: :model do
  subject { described_class.find_or_create_by! name: AppConstants::TEST_PROJECT }
  let!(:folder1) { Folder.find_or_create_by! name: AppConstants::TEST_FOLDER }

  describe '.create!' do
    context 'without a name or title' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context 'with 1 character name and title' do
      it { expect { described_class.create! name: 'a', title: 'title' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context 'with 2+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'as', title: 'title' }.to_not raise_error }
    end

    context 'has unique name' do
      it do
        rs = described_class.create! name: 'a12', title: 'irrelevant'
        expect { described_class.create! name: 'a12', title: 'irrelevant' }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end
  end

  describe 'active projects' do
    it do
      described_class.find_or_create_by! name: 'Test Project Active', title: 'title'
      described_class.find_or_create_by! name: 'Test Archived', archived: true, title: 'title'
      expect(described_class.list_active_projects).not_to include 'Archived '
    end 
  end
  
  describe '#to_s' do
    it { expect(subject.to_s).to eq AppConstants::TEST_PROJECT }
  end

  describe 'created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
