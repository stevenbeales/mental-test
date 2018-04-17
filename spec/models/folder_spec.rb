# frozen_string_literal: true

RSpec.describe Folder, type: :model do
  subject { ProjectTestFactory.test_folder }
  let!(:project1) { ProjectTestFactory.test_project }
  
  include_examples 'valid object creation', Folder

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[projects name]
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'name', 2
  
  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_FOLDER

  describe '#destroy!' do
    context 'with projects' do 
      it do
        project2 = Project.find_or_create_by! name: TestConstants::TEST_PROJECT2, 
                                              title: TestConstants::TEST_PROJECT_TITLE2
        folder = Folder.create! name: 'a13'
        begin
          folder.projects.concat [project1, project2]
        ensure
          folder.destroy! 
          expect(project1).not_to be_nil
        end
      end
    end
  end

  include_examples '#to_s', 'Name', TestConstants::TEST_FOLDER
end
