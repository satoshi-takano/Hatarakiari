require 'spec_helper'

describe Work do

  describe 'Work#url=' do
    context 'when set protocol less url' do
      it 'append http protocol to front of the passed url' do
        FactoryGirl.build(:work1).url.should == 'http://test.hataraki.in'
      end  
    end

    context 'when set protocol appended url' do
      it 'do nothing' do
        FactoryGirl.build(:work2).url.should == 'http://test.hataraki.in'
        FactoryGirl.build(:work3).url.should == 'https://test.hataraki.in'
      end
    end
  end

  describe 'Work#year' do
    context 'default value' do
      it 'is now' do
        Work.new.year.should == Time.now.year
      end
    end
  end

  describe 'Work#roles' do
    it 'should return [iOS, Android]' do
     FactoryGirl.build(:work1).roles.should == ['iOS', 'Android']
    end
  end
    
end
