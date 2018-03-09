require 'spec_helper'
require 'reek/spec'

include Reek
include Reek::Spec

describe ShouldReekOnlyOf do
  before :each do
    @expected_smell_class = :NestedIterators
    @expected_context_name = 'SmellyClass#big_method'
    @matcher = ShouldReekOnlyOf.new(@expected_smell_class, [/#{@expected_context_name}/])
    @examiner = double('examiner').as_null_object
    expect(@examiner).to receive(:smells) { smells }
    @match = @matcher.matches_examiner?(@examiner)
  end

  shared_examples_for 'no match' do
    it 'does not match' do
      expect(@match).to be_falsey
    end
    context 'when a match was expected' do
      before :each do
        @source = 'the_path/to_a/source_file.rb'
        expect(@examiner).to receive(:description).and_return(@source)
      end
      it 'reports the source' do
        expect(@matcher.failure_message).to match(@source)
      end
      it 'reports the expected smell class' do
        expect(@matcher.failure_message).to match(@expected_smell_class.to_s)
      end
    end
  end

  context 'with no smells' do
    def smells
      []
    end

    it_should_behave_like 'no match'
  end

  context 'with 1 non-matching smell' do
    def smells
      [SmellWarning.new('ControlCouple', 'context', [1], 'any old message')]
    end

    it_should_behave_like 'no match'
  end

  context 'with 2 non-matching smells' do
    def smells
      [
        SmellWarning.new('ControlCouple', 'context', [1], 'any old message'),
        SmellWarning.new('FeatureEnvy', 'context', [1], 'any old message')
      ]
    end

    it_should_behave_like 'no match'
  end

  context 'with 1 non-matching and 1 matching smell' do
    def smells
      [
        SmellWarning.new('ControlCouple', 'context', [1], 'any old message'),
        SmellWarning.new(@expected_smell_class.to_s, 'context', [1], "message mentioning #{@expected_context_name}")
      ]
    end

    it_should_behave_like 'no match'
  end

  context 'with 1 matching smell' do
    def smells
      [SmellWarning.new(@expected_smell_class.to_s, nil, [1], "message mentioning #{@expected_context_name}")]
    end
    it 'matches' do
      expect(@match).to be_truthy
    end
    it 'reports the expected smell when no match was expected' do
      expect(@matcher.failure_message_when_negated).to match(@expected_smell_class.to_s)
    end
    it 'reports the source when no match was expected' do
      source = 'the_path/to_a/source_file.rb'
      expect(@examiner).to receive(:description).and_return(source)
      expect(@matcher.failure_message_when_negated).to match(source)
    end
  end
end
