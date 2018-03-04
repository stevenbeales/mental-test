# frozen_string_literal: true

require './models/init'

RSpec.describe Score, type: :model do
  subject { described_class.create_with(score: 1).find_or_create_by! assessment: ass, name: 'total' }
  let(:ass) { Assessment.find_or_create_by! visit: vt }
  let!(:sy) { Survey.find_or_create_by! name: AppConstants::TEST_SURVEY }
  let!(:ur) { User.find_or_create_by! username: AppConstants::TEST_USER }
  let!(:vt) { Visit.find_or_create_by! user: ur, name: Faker::Name.prefix, survey: sy }
  let!(:choice) { Choice.find_or_create_by! rating_scale: scale, value: 'val', description: 'text' }
  let!(:scale) { RatingScale.find_or_create_by! name: AppConstants::TEST_RATING_SCALE }

  describe '#to_s' do
    it { expect(subject.to_s).to eq "#{subject.assessment} #{subject.name}: #{subject.score}" }   
  end
end
