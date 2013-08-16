require 'spec_helper'

describe GuestsController do
  include Helpers

  before do
    @user = FactoryGirl.create(:github_user)
  end

  context 'when user logged in' do
    before do
      admin_login(@user)
      current_user.guests.reset
    end

    describe '#create' do
      it 'shoud create a new guest' do
        expect {
          post :create, :guest=>{ :login_id=>"guest", :login_password=>"secret password", :user_id=>current_user.id }
        }.to change(current_user.guests, :length).by(1)
      end
    end

    describe '#update' do
      it 'should update the memo attribute of the guest' do
        post :create, :guest=>{ :login_id=>"guest", :login_password=>"secret password", :memo=>'memo' }
        expect(current_user.guests.first.memo).to eq 'memo'
        post :update, :id=>current_user.guests.last.id, :guest=>{ :memo=>'updated memo' }
        expect(current_user.guests.first.memo).to eq 'updated memo'        
      end
    end

    describe '#destroy' do
      it 'should destroy the guest' do
        post :create, :guest=>{ :login_id=>"guest", :login_password=>"secret password", :user_id=>current_user.id }
        post :destroy, :id=>current_user.guests.first.id
        current_user.reload
        expect(current_user.guests.length).to eq 0
      end
    end
  end

  context 'when user does not logged in' do
    describe '#create' do
      it 'shoud not create new guest' do
        expect {
          post :create, :guest=>{ :login_id=>"guest", :login_password=>"secret password", :user_id=>@user.id }
        }.not_to change(@user.guests, :length)
      end
    end

    describe '#update' do
      it 'should not update the memo attribute of the guest' do
        admin_login(@user)
        
        post :create, :guest=>{ :login_id=>"guest", :login_password=>"secret password", :memo=>'memo' }
        expect(current_user.guests.first.memo).to eq 'memo'

        logout
        
        post :update, :id=>@user.id, :guest=>{ :memo=>'updated memo' }
        expect(@user.guests.first.memo).to eq 'memo'        
      end
    end

    describe '#destroy' do
      it 'should not destroy the guest' do
        admin_login(@user)
        post :create, :guest=>{ :login_id=>"guest", :login_password=>"secret password", :user_id=>current_user.id }

        logout
        
        post :destroy, :id=>@user.guests.first.id
        @user.reload
        expect(@user.guests.length).to eq 1
      end
    end
  end
  
end
