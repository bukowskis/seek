require 'spec_helper'

describe Seek do

  let(:params)  { { page: 4, per_page: 20, 'sort_by' => :first_name, sort_direction: 'DESC' } }
  let(:options) { { 'max_per_page' => 30, valid_sort_bys: %w{ age first_name last_name } } }

  let(:seek)    { Seek.new params, options }

  context 'pagination' do
    describe 'page' do
      it 'comes from the params' do
        seek.page.should == 4
      end

      it 'is has a positive attitude' do
        seek = Seek.new params.merge page: 'what?'
        seek.page.should == 1
      end
    end

    describe '#per_page' do
      it 'takes the default from the configuration if nothing provided' do
        Seek.new.per_page.should == 20
      end

      it 'comes from the params' do
        seek.per_page.should == 20
      end

      it 'limits the maximum' do
        seek = Seek.new params, max_per_page: 15
        seek.per_page.should == 15
      end

      it 'falls back to the default on weird values' do
        seek = Seek.new params.merge(per_page: 'what?')
        seek.per_page.should == 20
      end
    end

    describe '#max_per_page' do
      it 'defaults to the global configuration' do
        Seek.new.max_per_page.should == 100
      end

      it 'prefers the options' do
        seek.max_per_page.should == 30
      end
    end
  end

  context 'sorting' do
    describe '#sort_by' do
      it 'comes from the params and is a String' do
        seek.sort_by.should == 'first_name'
      end

      it 'defaults to the first valid sort_by' do
        seek = Seek.new nil, options
        seek.sort_by.should == 'age'
      end

      it 'accepts only valid values if the valid ones are specified' do
        seek = Seek.new({ sort_by: 'size'} , options)
        seek.sort_by.should == 'age'
      end

      it 'accepts invalid values if no valid ones are specified' do
        seek = Seek.new sort_by: 'width'
        seek.sort_by.should == 'width'
      end

      it 'is nil if there is no sort_by' do
        Seek.new.sort_by.should be_nil
      end
    end

    describe '#sort_direction' do
      it 'comes from the params and is a String' do
        seek.sort_direction.should == 'desc'
      end

      it 'is ascending if nothing is specified' do
        Seek.new.sort_direction.should == 'asc'
      end

      it 'is ascending if something invalid is specified' do
        Seek.new(sort_direction: 'vertically').sort_direction.should == 'asc'
      end
    end
  end

  describe '#order' do
    it 'is sort_by and sort_direction separated by a space' do
      seek.order.should == 'first_name desc'
    end

    it 'is nil if there is no sort_by' do
      Seek.new.order.should be_nil
    end
  end

  describe '#sortable?' do
    it 'is true if there is sort_by and sort_direction' do
      seek.should be_sortable
    end

    it 'is nil if there is no sort_by' do
      Seek.new.should_not be_sortable
    end
  end

  describe '#to_hash' do
    it 'contains all params' do
      seek.to_hash.should == { page: 4, per_page: 20, sort_by: 'first_name', sort_direction: 'desc', order: 'first_name desc' }
    end
  end

end
