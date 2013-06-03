require 'spec_helper'

describe ApplicationController do
  include Helpers

  describe 'ApplicationController#current_user' do
    context 'when user not logged in' do
      it 'returns nil' do
        current_user.should be_nil
      end
    end
    context 'when user logged in' do
      before do
        admin_login(FactoryGirl.create(:github_user))
      end
      it 'returns a logged in user' do
        current_user.should_not be_nil
      end
    end
  end

  describe 'ApplicationController#current_guest' do
    context 'when guest not logged in' do
      it 'returns nil' do
        current_guest.should be_nil
      end
    end
    context 'when guest logged in' do
      before do
        guest_login(FactoryGirl.create(:guest1))
      end
      it 'returns a logged in guest' do
        current_guest.should_not be_nil
      end
    end
  end
  
end
