require 'spec_helper'

describe WorksController do
  include Helpers
  render_views

  before do
    @user = FactoryGirl.create(:github_user)
  end

  context 'when user logged in' do
    before do
      admin_login(@user)
    end

    describe 'helper test' do
      it 'should return 2012' do
        getWorksEachYears(current_user)[0][0].year.should == 2012
      end

      it 'should return {"Native" => 1, "iOS" => 1}' do
        getAllRoles(current_user).should == { 'Native' => 1, 'iOS' => 1}
      end
    end

    describe '#index' do
      it 'should render works/index' do
        get :index
        response.body.should include("<title>Portfolio")
      end
    end

    describe '#show' do
      it 'should render works/show' do
        get :show, :id=>@user.works.first.id
        response.body.should include("<title>" + @user.works.first.name)
      end
    end

    describe '#create' do
      it 'shoudl create a new work' do
        expect {
          post :create, :work=>{ :name=>'work 2', :image_0=>fixture_file_upload('/files/0.png', 'image/png') }
        }.to change(current_user.works, :length).by(1)
      end
    end

    describe '#update' do
      it 'should update the name attribete of the work' do
        post :create, :work=>{ :name=>'this is work 2', :image_0=>fixture_file_upload('/files/0.png', 'image/png') }
        expect(current_user.works.last.name).to eq 'this is work 2'
        post :update, :id=>current_user.works.last.id, :work=>{ :name=>'updated name' }
        current_user.reload
        expect(current_user.works.last.name).to eq 'updated name'
      end
    end

    describe '#destroy' do
      it 'should destroy the work' do
        post :create, :work=>{ :name=>'this is work 2', :image_0=>fixture_file_upload('/files/0.png', 'image/png') }
        l = current_user.works.length
        post :destroy, :id=>current_user.works.last.id
        current_user.reload
        expect(current_user.works.length).to eq l-1
      end
    end
  end

  context 'when user does not logged in' do
    describe '#create' do
      it 'should not create new work' do
        expect {
          post :create, :work=>{ :name=>'this is work 2', :image_0=>fixture_file_upload('/files/0.png', 'image/png') }
        }.not_to change(@user.works, :length)
      end
    end

    describe '#update' do
      it 'should not update the name attribete of the work' do
        admin_login(@user)

        post :create, :work=>{ :name=>'this is work 2', :image_0=>fixture_file_upload('/files/0.png', 'image/png') }
        expect(@user.works.last.name).to eq 'this is work 2'

        logout

        post :update, :id=>@user.works.last.id, :work=>{ :name=>'updated name' }
        @user.reload
        expect(@user.works.last.name).to eq 'this is work 2'
      end
    end

    describe '#destroy' do
      it 'should not destroy the work' do
        admin_login(@user)
        post :create, :work=>{ :name=>'this is work 2', :image_0=>fixture_file_upload('/files/0.png', 'image/png') }
        expect(@user.works.last.name).to eq 'this is work 2'

        logout
        
        l = @user.works.length
        post :destroy, :id=>@user.works.last.id
        @user.reload
        expect(@user.works.length).to eq l
      end
    end
  end
end
