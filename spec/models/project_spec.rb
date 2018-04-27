# frozen_string_literal: true

RSpec.describe Project, type: :model do
  subject { ProjectTestFactory.test_project }
  let!(:folder1) { ProjectTestFactory.test_folder }

  include_examples 'valid object creation', Project

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[title folder status name purpose]
    include_examples 'respond', %i[irb_number grant_number pi_firstname pi_lastname]
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'name', 2
  include_examples 'required attribute', 'title', 1

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
      it { expect { Project.create! name: 'a', title: 'title' }.to raise_error ActiveRecord::RecordInvalid }
    end

    context '2+ character name and title' do
      it { expect { Project.find_or_create_by! name: 'as', title: 'title' }.to_not raise_error }
    end

    context 'unique name' do
      it do
        rs = Project.create! name: 'a12', title: 'irrelevant'
        expect { Project.create! name: 'a12', title: 'irrelevant' }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end
  end

  describe 'active projects' do
    it do
      Project.find_or_create_by! name: 'Test Project Active', title: 'title', status: :production
      Project.find_or_create_by! name: 'Test Archived', title: 'title', status: :archived
      expect(Project.list_active_projects).not_to include 'Archived '
    end
  end

  include_examples '#to_s', 'Name', TestConstants::TEST_PROJECT

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
