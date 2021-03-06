# frozen_string_literal: true

RSpec.describe ResponseScale, type: :model do
  subject { InstrumentTestFactory.test_response_scale }

  include_examples 'valid object creation', ResponseScale

  describe '#respond_to?' do
    include_context 'shared attributes'
    include_examples 'respond', %i[choices items name]
    include_examples 'common attributes'
  end

  include_examples 'required attribute', 'name', 2

  include_examples 'create!_with_name', 'without a name', TestConstants::TEST_RESPONSE_SCALE

  include_examples '#to_s', 'Name', TestConstants::TEST_RESPONSE_SCALE

  describe '#destroy!' do
    context 'destroys choices' do
      rsubject = described_class.create! name: 'a13'
      begin
        c = Choice.create! response_scale: rsubject, value: 'val', description: 'text'
        c2 = Choice.create! response_scale: rsubject, value: 'val2', description: 'text2'
        c3 = Choice.create! response_scale: rsubject, value: 'val3', description: 'text3'
        rsubject.choices.concat [c, c2, c3]
      ensure
        rsubject.destroy!
        it { expect(Choice.where(response_scale_id: rsubject.id, value: 'val', description: 'text').first).to be_nil }
      end
    end
  end
end
