require 'test_helper'

class WorksControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
    @work = works(:one)
    login(users(:one))
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:years)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create work" do
    user = users(:one)
    
    assert_difference('Work.count') do
      post :create, work: { user_id: @user.id, client: @work.client, description: @work.description, name: @work.name, personal_work: @work.personal_work, role: @work.role, url: @work.url, year: @work.year, image_0: fixture_file_upload("/files/image.gif", "image/gif") }
    end

    assert_redirected_to work_path(assigns(:work))
  end

  test "should show work" do
    get :show, id: @work
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @work
    assert_response :success
  end

  test "should update work" do
    put :update, id: @work, work: { client: @work.client, description: @work.description, name: @work.name, personal_work: @work.personal_work, role: @work.role, url: @work.url, year: @work.year }
  end

  test "should destroy work" do
    assert_difference('Work.count', -1) do
      delete :destroy, id: @work
    end

    assert_redirected_to works_path
  end
end
