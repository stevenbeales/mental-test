# frozen_string_literal: true

RSpec.describe Folder, type: :model do
  subject { ProjectTestFactory.test_folder }
  let!(:project1) { ProjectTestFactory.test_project }
  let!(:project2) { ProjectTestFactory.test_project2 } 
  
  include_examples 'valid', Folder

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'attribute?', :projects
    include_examples 'attribute?', :name
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

  describe '.create!' do
    context 'without a name' do
      include_examples 'invalid create' 
    end  

    context 'with 1 character name' do
      it do
        expect { Folder.create! name: 'a' }.to raise_error \
          ActiveRecord::RecordInvalid
      end
    end
    
    context 'with 2+ character name' do
      it do
        expect do
          Folder.find_or_create_by! name: 'as' 
        end.to_not raise_error
      end
    end

    context 'with unique name' do
      it do
        rs = Folder.create! name: 'a12'
        expect { Folder.create! name: 'a12' }.to \
          raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end
  end

  describe '#destroy!' do
    context 'with projects' do 
      it do
        folder = Folder.create! name: 'a13'
        folder.projects.concat [project1, project2]
        folder.destroy! 
        expect(project1).not_to be_nil 
      end
    end
  end
  
  describe '#to_s' do
    it { expect(subject.to_s).to eq TestConstants::TEST_FOLDER }
  end
end
