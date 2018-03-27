# frozen_string_literal: true

RSpec.describe Item, type: :model do
  subject { Item.find_or_create_by! name: 'Appetite1' }
  let!(:instrument) { InstrumentTestFactory.test_instrument }

  it 'is an instance of Item' do
    expect(subject).to be_an Item
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  describe '#respond_to?' do
    include_context 'shared attributes'
   
    context '#name' do
      it { expect(subject.respond_to?(:name)).to be_truthy }
    end
    it { expect(subject.respond_to?(:choices)).to be_truthy }
    it { expect(subject.respond_to?(:instrument)).to be_truthy }
    it { expect(subject.respond_to?(:response_scale)).to be_truthy }
    context 'common attributes' do
      it { expect(timestamps?).to be_truthy }
    end 
  end

  describe '#name' do
    include_context 'restore attributes'
    
    it 'is required' do
      subject.name = nil
      subject.valid?
      expect(subject.errors[:name].size).to eq(2)
    end
  end

  describe 'test item #choices' do
    it 'has 5 choices' do
      expect(subject.choices.count).to eq(5)
    end
  end

  describe 'test item #find_choice_by_value' do
    it 'has choice eq 0' do
      choice = subject.find_choice_by_value('0')
      expect(choice.value).to eq('0')
    end
  end

  describe '#to_s' do
    it do
      item = described_class.new(name: 'Time')
      expect(item.to_s).to eq(item.name) 
    end
  end

  describe '#find_by_name' do
    it do
      expect(subject.name).to eq('Appetite1')
    end
  end

  describe '#instrument' do
    it do
      expect(subject.instrument.id).to eq(instrument.id)
    end
  end
  
  describe '#created_at today' do
    # expect record to be created within the last 
    # 5 minutes to check timestamp works
    it 'is created less than 5 minutes ago' do
      expect(Time.now - subject.created_at).to be < 300
    end
  end
end
