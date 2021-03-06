# frozen_string_literal: true

RSpec.describe Item, type: :model do
  subject { Item.find_or_create_by! name: 'Appetite1' }
  let!(:instrument) { InstrumentTestFactory.test_instrument }
  
  include_examples 'valid object creation', Item

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[choices instrument response_scale name item_type]
    include_examples 'discard attribute'
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'name', 2
  include_examples 'required attribute', 'item_type', 2
  
  describe '#item_type' do
    include_context 'restore attributes'
    
    it 'must not be shorter than 3 character' do
      subject.item_type = 'as'
      subject.valid?
      expect(subject.errors[:item_type].size).to eq(1)
    end
    
    it 'must be at least 3 characters' do
      subject.item_type = 'abc'
      subject.valid?
      expect(subject.errors[:item_type].size).to eq(0)
    end
  end

  describe 'test item' do
    it { expect(subject.item_type).to eq 'radiogroup' }
  
    context '#choices' do
      it 'has 5 choices' do
        expect(subject.choices.count).to eq(5)
      end
    end

    context '#find_choice_by_value' do
      it 'has choice eq 0' do
        choice = subject.find_choice_by_value('0')
        expect(choice.value).to eq('0')
      end
    end
  end

  describe '#to_s' do
    it do
      item = Item.new(name: 'Time')
      expect(item.to_s).to eq(item.name) 
    end
  end

  describe '#find_by_name' do
    it { expect(subject.name).to eq('Appetite1') }
  end

  describe '#instrument' do
    it { expect(subject.instrument.id).to eq(instrument.id) }
  end

  describe '#discard' do
    instrument2 = Instrument.find_or_create_by!(name: 'instrument 3')
    item2 = Item.find_or_create_by! name: 'Item 2', instrument: instrument2, 
                                    item_type: 'radiogroup', title: 'abc'
    include_examples 'discards', item2
  end
end
