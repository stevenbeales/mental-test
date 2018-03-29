# frozen_string_literal: true

RSpec.describe Score, type: :model do
  subject { Score.create_with(score: 1).find_or_create_by! assessment: ass, name: 'total' }
  let(:ass) { TestFactory.test_assessment }
  let!(:sy) { TestFactory.test_survey }
  let!(:ur) { TestFactory.test_user }
  let!(:vt) { TestFactory.test_visit }
  let!(:choice) { TestFactory.test_choice }
  let!(:scale) { InstrumentTestFactory.test_response_scale }

  include_examples 'valid object creation', Score

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'responds', :survey
    include_examples 'responds', :participant
    include_examples 'responds', :visit
    include_examples 'responds', :score
    include_examples 'responds', :assessment
    include_examples 'responds', :name
    include_examples 'common attributes'
  end
  
  describe '#score' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.score = nil
      subject.valid?
      expect(subject.errors[:score].size).to eq(1)
    end
 
    context 'must be an integer' do
      it do
        subject.score = 1.5
        subject.valid?
        expect(subject.errors[:score].size).to eq(1)
      end
    end
  end

  describe '#name' do
    include_context 'restore attributes'
 
    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(1)
    end
  end

  include_examples 'invalid create', 'without assessment or name' 

  describe '.create!' do
    context 'without assessment' do
      it { expect { described_class.create!(name: 'total') }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'without name' do
      it { expect { described_class.create!(assessment: ass) }.to raise_error ActiveRecord::RecordInvalid }
    end

    context 'assessment and name' do
      it { expect { Score.create_with(score: 8).find_or_create_by!(assessment: ass, name: 'tote') }.not_to raise_error }
    end

    context 'duplicate assessment and name' do
      it do
        expect do 
          Score.create!(assessment: ass, name: 'tote', order_number: 1).to raise_error ActiveRecord::RecordInvalid
        end
      end 

      it { expect { described_class.create!(assessment: ass, name: 'tote', order_number: 2).not_to raise_error } }
    end
  end
  
  describe '#to_s' do
    it 'prints assessment name: score' do
      expect(subject.to_s).to eq "#{subject.assessment} #{subject.name}: #{subject.score}" 
    end   
  end

  describe '#destroy!' do
    context 'preserves assessment' do
      it do
        subject.destroy!
        expect(ass).not_to be_nil
      end
    end
    
    describe 'destroys multiple scores' do
      it do
        ass.scores.each(&:destroy!)
        expect(ass.scores.count.to_s).to eq '0' 
      end

      it do
        rep2 = described_class.create_with(score: 2).find_or_create_by! assessment: ass, name: 'Depression' 
        rep3 = described_class.create_with(score: 5).find_or_create_by! assessment: ass, name: 'Anxiety' 
        ass.scores.concat([rep2, rep3])
        expect(subject.assessment.scores.count.to_s).to eq '3'     
        ass.scores.each(&:destroy!)
      end
    end
  end
end
