# frozen_string_literal: true

RSpec.describe Study, type: :model do
  subject { TestFactory.test_study }
  let!(:schedule) { TestFactory.test_schedule }

  include_examples 'valid object creation', Study

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[study_participants participants schedule name]
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'name', 2

  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_STUDY

  include_examples '#to_s', 'name', TestConstants::TEST_STUDY

  describe '#destroy' do
    it do
      test_study2 = Study.find_or_create_by! name: TestConstants::TEST_STUDY2
      sc = test_study2.schedule
      test_study2.destroy!
      expect(sc).to be_nil
    end
  end
end
