require 'test_helper'

class AnnouncmentsControllerTest < ActionController::TestCase
  setup do
    @announcment = announcments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:announcments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create announcment" do
    assert_difference('Announcment.count') do
      post :create, announcment: { content: @announcment.content, period_id: @announcment.period_id, is_advisor_confirmation: @announcment.is_advisor_confirmation, is_view: @announcment.is_view, title: @announcment.title }
    end

    assert_redirected_to announcment_path(assigns(:announcment))
  end

  test "should show announcment" do
    get :show, id: @announcment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @announcment
    assert_response :success
  end

  test "should update announcment" do
    patch :update, id: @announcment, announcment: { content: @announcment.content, period_id: @announcment.period_id, is_advisor_confirmation: @announcment.is_advisor_confirmation, is_view: @announcment.is_view, title: @announcment.title }
    assert_redirected_to announcment_path(assigns(:announcment))
  end

  test "should destroy announcment" do
    assert_difference('Announcment.count', -1) do
      delete :destroy, id: @announcment
    end

    assert_redirected_to announcments_path
  end
end
