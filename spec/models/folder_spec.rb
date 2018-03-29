# frozen_string_literal: true

RSpec.describe Folder, type: :model do
  subject { ProjectTestFactory.test_folder }
  let!(:project1) { ProjectTestFactory.test_project }
  let!(:project2) { ProjectTestFactory.test_project2 } 
  
  include_examples 'valid object creation', Folder

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :projects
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

  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_FOLDER

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

  include_examples '#to_s', 'Name', TestConstants::TEST_FOLDER
end
