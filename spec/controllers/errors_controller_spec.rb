require 'spec_helper'

describe ErrorsController, :type=>:controller do
  describe 'GET 404' do
    it 'returns 200' do
      get :error_404
      response.should be_successful
    end
  end

  describe 'GET 401' do
    it 'returns 200' do
      get :error_401
      response.should be_successful
    end
  end
end
