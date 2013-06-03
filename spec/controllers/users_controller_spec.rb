require 'spec_helper'

describe UsersController do
  include Helpers
  render_views

  before do
    user = FactoryGirl.create(:github_user)
    @guest = user.guests.create({ :login_id=>'foo', :login_password=>'secret password'})
  end
  
  context 'when guest logged in' do
    before do
      guest_login(@guest)
    end
    
    describe '#show_works' do
      it 'should render works/index' do
        get :show_works, :user_id=>current_guest.user.id
        response.body.should include("<title>Portfolio")
        get :show_works, :user_id=>1234
        response.body.should include("<title>Sign in")        
      end
    end

    describe '#show' do
      it 'should render works/show' do
        user = current_guest.user
        get :show, :user_id=>user.id, :work_id=>user.works.first
        response.body.should include(user.works.first.name)
      end
    end
  end

  context 'when guest does not logged in' do
    describe '#show_works' do
      it 'should render users/authenticate' do
        get :show_works, :user_id=>@guest.user.id
        response.body.should include("<title>Sign in")
      end
    end

    describe '#show' do
      it 'should render users/authenticate' do
        get :show, :user_id=>@guest.user.id
        response.body.should include("<title>Sign in")
      end
    end
  end
end
