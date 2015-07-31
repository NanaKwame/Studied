require 'test_helper'

class ReferencedbooksControllerTest < ActionController::TestCase
  setup do
    @referencedbook = referencedbooks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referencedbooks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referencedbook" do
    assert_difference('Referencedbook.count') do
      post :create, referencedbook: {  }
    end

    assert_redirected_to referencedbook_path(assigns(:referencedbook))
  end

  test "should show referencedbook" do
    get :show, id: @referencedbook
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referencedbook
    assert_response :success
  end

  test "should update referencedbook" do
    patch :update, id: @referencedbook, referencedbook: {  }
    assert_redirected_to referencedbook_path(assigns(:referencedbook))
  end

  test "should destroy referencedbook" do
    assert_difference('Referencedbook.count', -1) do
      delete :destroy, id: @referencedbook
    end

    assert_redirected_to referencedbooks_path
  end
end
