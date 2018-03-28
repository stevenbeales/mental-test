# frozen_string_literal: true

RSpec.describe ResponseScale, type: :model do
  subject { InstrumentTestFactory.test_response_scale }
  
  include_examples 'valid', ResponseScale

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

  describe '#respond_to?' do
    include_context 'shared attributes'
   
    it { expect(subject.respond_to?(:items)).to be_truthy }
    it { expect(subject.respond_to?(:choices)).to be_truthy }

    include_examples 'attribute?', :name
    include_examples 'common attributes'
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
    it { expect(subject.to_s).to eq TestConstants::TEST_RESPONSE_SCALE }
  end
    
  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
