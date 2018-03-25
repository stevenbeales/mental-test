# frozen_string_literal: true

RSpec.describe Score, type: :model do
  subject { described_class.create_with(score: 1).find_or_create_by! assessment: ass, name: 'total' }
  let(:ass) { TestFactory.test_assessment }
  let!(:sy) { TestFactory.test_survey }
  let!(:ur) { TestFactory.test_user }
  let!(:vt) { TestFactory.test_visit }
  let!(:choice) { TestFactory.test_choice }
  let!(:scale) { TestFactory.test_response_scale }

  it 'is an instance of Score' do
    expect(subject).to be_an Score
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    it { expect(subject.respond_to?(:name)).to be_truthy }
    it { expect(subject.respond_to?(:assessment)).to be_truthy }
    it { expect(subject.respond_to?(:score)).to be_truthy }
    it { expect(subject.respond_to?(:visit)).to be_truthy }
    it { expect(subject.respond_to?(:survey)).to be_truthy }
    it { expect(subject.respond_to?(:participant)).to be_truthy }
    context '#created_at' do
      it { expect(subject.respond_to?(:created_at)).to be_truthy }
    end
    context '#updated_at' do
      it { expect(subject.respond_to?(:updated_at)).to be_truthy }
    end 
    context '#not_an_attibute' do
      it { expect(subject.respond_to?(:not_an_attibute)).not_to be_truthy }
    end
  end
  
  describe '#score' do
    after(:each) do
      subject.restore_attributes
    end
    
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
    after(:each) do
      subject.restore_attributes
    end

    it do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(1)
    end
  end

  describe '.create!' do
    context 'without assessment or name' do
      it { expect { described_class.create! }.to raise_error ActiveRecord::RecordInvalid }
    end

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
        expect { Score.create!(assessment: ass, name: 'tote', order_number: 1).to raise_error ActiveRecord::RecordInvalid }
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

  describe '#created_at today' do
    # expect record to be created within the last 5 minutes to check timestamp works
    it { expect(Time.now - subject.created_at).to be < 300 }
  end
end
