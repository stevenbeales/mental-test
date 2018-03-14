# frozen_string_literal: true

RSpec.describe ResponseScale, type: :model do
  subject { TestFactory.test_response_scale }
  
  it 'is an instance of ResponseScale' do
    expect(subject).to be_an ResponseScale
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '.create!' do
    context 'without a name' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end  

    context '1 character name' do
      it { expect { described_class.create! name: 'a' }.to raise_error ActiveRecord::RecordInvalid }
    end
    
    context '2+ character name' do
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
    context 'destroys choices' do 
      rsubject = described_class.create! name: 'a13'
      c = Choice.create! response_scale: rsubject, value: 'val', description: 'text'
      c2 = Choice.create! response_scale: rsubject, value: 'val2', description: 'text2'
      c3 = Choice.create! response_scale: rsubject, value: 'val3', description: 'text3'
      rsubject.choices.concat [c, c2, c3]   
      rsubject.destroy! 
      it { expect(Choice.where(response_scale_id: rsubject.id, value: 'val', description: 'text').first).to be_nil } 
    end
  end
  
  describe '#to_s' do
    it { expect(subject.to_s).to eq AppConstants::TEST_RESPONSE_SCALE }
  end
    
  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
