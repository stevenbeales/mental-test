# frozen_string_literal: true

RSpec.describe Folder, type: :model do
  subject { described_class.find_or_create_by! name: AppConstants::TEST_FOLDER }
  let!(:project1) { Project.find_or_create_by! name: AppConstants::TEST_PROJECT, title: AppConstants::TEST_PROJECT_TITLE } 
  let!(:project2) { Project.find_or_create_by! name: 'Project 2', title: 'Test Project 2 title' } 
  
  describe '.create!' do
    context 'without a name' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context 'with 1 character name' do
      it { expect { described_class.create! name: 'a' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context 'with 2+ character name' do
      it { expect { described_class.find_or_create_by! name: 'as' }.to_not raise_error }
    end

    context 'has unique name' do
      it do
        rs = described_class.create! name: 'a12'
        expect { described_class.create! name: 'a12' }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end
  end

  describe '#destroy!' do
    context 'does not destroy projects' do 
      it do
        folder = described_class.create! name: 'a13'
        folder.projects.concat [project1, project2]
        folder.destroy! 
        expect(project1).not_to be_nil 
      end
    end
  end
  
  describe '#to_s' do
    it { expect(subject.to_s).to eq AppConstants::TEST_FOLDER }
  end

  describe 'created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end