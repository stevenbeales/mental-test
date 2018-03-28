# frozen_string_literal: true

RSpec.describe Project, type: :model do
  subject { ProjectTestFactory.test_project }
  let!(:folder1) { ProjectTestFactory.test_folder }

  include_examples 'valid object creation', Project
  
  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :title
    include_examples 'responds', :folder
    include_examples 'responds', :status
    include_examples 'responds', :name
    include_examples 'common attributes'
  end

  describe '#name' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end

  describe '#title' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.title = nil
      subject.valid?
      expect(subject.errors[:title].size).to eq(1)
    end
  end

  describe '#status' do
    context 'valid' do
      it do
        subject.status = :development
        subject.valid?
        expect(subject.errors[:status].size).to eq(0)     
      end

      it do
        subject.status = :production
        subject.valid?
        expect(subject.errors[:status].size).to eq(0)     
      end

      it do
        subject.status = :inactive
        subject.valid?
        expect(subject.errors[:status].size).to eq(0)     
      end

      it do
        subject.status = :archived
        subject.valid?
        expect(subject.errors[:status].size).to eq(0)     
      end
    end

    context 'invalid' do
      it { expect { subject.status = :invalid }.to raise_error(ArgumentError) }
    end
  end
  
  include_examples 'invalid create', 'without name or title'
   
  describe '.create!' do
    context '1 character name and title' do
      it { expect { described_class.create! name: 'a', title: 'title' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context '2+ character name and title' do
      it { expect { described_class.find_or_create_by! name: 'as', title: 'title' }.to_not raise_error }
    end

    context 'unique name' do
      it do
        rs = described_class.create! name: 'a12', title: 'irrelevant'
        expect { described_class.create! name: 'a12', title: 'irrelevant' }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end
  end

  describe 'active projects' do
    it do
      described_class.find_or_create_by! name: 'Test Project Active', title: 'title', status: :production
      described_class.find_or_create_by! name: 'Test Archived', title: 'title', status: :archived
      expect(described_class.list_active_projects).not_to include 'Archived '
    end 
  end
  
  describe '#to_s' do
    it { expect(subject.to_s).to eq TestConstants::TEST_PROJECT }
  end

  describe '#destroy!' do
    context 'does not remove folder' do
      it do
        subject.folder = folder1
        subject.destroy!
        expect { folder1.not_to be_nil }
      end
    end
  end
end
