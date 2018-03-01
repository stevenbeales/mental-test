# frozen_string_literal: true

RSpec.describe RatingScale, type: :model do
  subject { described_class.find_or_create_by! name: AppConstants::TEST_RATING_SCALE }
  
  describe '.create!' do
    context 'without a name' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context 'with a 1 character name' do
      it { expect { described_class.create! name: 'a' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context 'with a 2+ character name' do
      it { expect { described_class.create! name: 'as' }.to_not raise_error }
    end

    context 'has a unique name' do
      it do
        rs = described_class.create! name: 'a12'
        expect { described_class.create! name: 'a12' }.to raise_error ActiveRecord::RecordInvalid
        rs.destroy!
      end
    end
  end

  describe '#destroy!' do
    context 'destroys choices' do 
      rsubject = described_class.create! name: 'a13'
      c = Choice.create! rating_scale: rsubject, value: 'val', description: 'text'
      c2 = Choice.create! rating_scale: rsubject, value: 'val2', description: 'text2'
      c3 = Choice.create! rating_scale: rsubject, value: 'val3', description: 'text3'
      rsubject.choices.concat [c, c2, c3]   
      rsubject.destroy! 
      it { expect(Choice.where(rating_scale_id: rsubject.id, value: 'val', description: 'text').first).to be_nil } 
    end
  end
  
  describe '#to_s' do
    it { expect(subject.to_s).to eq AppConstants::TEST_RATING_SCALE }
  end
end
