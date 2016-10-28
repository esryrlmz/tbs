require 'test_helper'

class SystemAnnouncmentsControllerTest < ActionController::TestCase
  setup do
    @system_announcment = system_announcments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:system_announcments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create system_announcment" do
    assert_difference('SystemAnnouncment.count') do
      post :create, system_announcment: { content: @system_announcment.content, is_view: @system_announcment.is_view, title: @system_announcment.title }
    end

    assert_redirected_to system_announcment_path(assigns(:system_announcment))
  end

  test "should show system_announcment" do
    get :show, id: @system_announcment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @system_announcment
    assert_response :success
  end

  test "should update system_announcment" do
    patch :update, id: @system_announcment, system_announcment: { content: @system_announcment.content, is_view: @system_announcment.is_view, title: @system_announcment.title }
    assert_redirected_to system_announcment_path(assigns(:system_announcment))
  end

  test "should destroy system_announcment" do
    assert_difference('SystemAnnouncment.count', -1) do
      delete :destroy, id: @system_announcment
    end

    assert_redirected_to system_announcments_path
  end
end
