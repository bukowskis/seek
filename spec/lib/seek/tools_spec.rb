require 'spec_helper'

describe Seek::Tools do

  let(:original) { { 'one' => 1, two: 2 } }

  describe '.symbolize_keys' do
    it 'symbolizes String keys in a hash' do
      Seek::Tools.symbolize_keys(original).should == { one: 1, two: 2 }
      original.should == { 'one' => 1, two: 2 }
    end
  end

end
