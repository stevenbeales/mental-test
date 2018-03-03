# https://gist.github.com/morhekil/998709

require 'rspec'
require 'dry/config/deep_symbolizable'

describe 'Hash#deep_symbolize' do
  let(:hash) { {} }
  subject do
    #hash.extend DeepSymbolizable
    hash.deep_symbolize
  end


  context 'on simple hash' do
    let(:hash) { {:key1 => 'val1', 'key2' => 'val2'} }
    it {
      h2 = hash.deep_symbolize
      expect(h2).to eql({:key1 => 'val1', :key2 => 'val2'})
    }

    context 'when inverting' do
      let(:hash) { {'key1' => 'val1', 'key2' => 'val2'} }
      it {
        h2 = hash.deep_symbolize
        expect(h2).to eql({:key1 => 'val1', :key2 => 'val2'})

        h3 = h2.deep_symbolize(true)
        expect(h3).to eql({'key1' => 'val1', 'key2' => 'val2'})
      }
    end
  end

  context 'on nested hash' do
    let(:hash) { {'key1' => 'val1', 'subkey' => {'key2' => 'val2'}} }
    it {
      h2 = hash.deep_symbolize
      expect(h2).to eql({:key1 => 'val1', :subkey => {:key2 => 'val2'}})
    }


    context 'with nested array' do
      let(:hash) { {'key1' => 'val1', 'subkey' => [{'key2' => 'val2'}]} }
      it {
        h2 = hash.deep_symbolize
        expect(h2).to eql({:key1 => 'val1', :subkey => [{:key2 => 'val2'}]})
      }
    end
  end


  describe 'block preprocessing keys' do
    let(:hash) { {'key1' => 'val1', 'subkey' => [{'key2' => 'val2'}]} }
    it {
      h2 = hash.deep_symbolize{ |k| k.upcase }
      expect(h2).to eql({:KEY1 => 'val1', :SUBKEY => [{:KEY2 => 'val2'}]})
    }
  end
end