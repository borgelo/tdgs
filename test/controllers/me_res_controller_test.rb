require 'test_helper'

class MeResControllerTest < ActionController::TestCase
  setup do
    @me_re = me_res(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:me_res)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create me_re" do
    assert_difference('MeRe.count') do
      post :create, me_re: { meal: @me_re.meal, recipe: @me_re.recipe }
    end

    assert_redirected_to me_re_path(assigns(:me_re))
  end

  test "should show me_re" do
    get :show, id: @me_re
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @me_re
    assert_response :success
  end

  test "should update me_re" do
    patch :update, id: @me_re, me_re: { meal: @me_re.meal, recipe: @me_re.recipe }
    assert_redirected_to me_re_path(assigns(:me_re))
  end

  test "should destroy me_re" do
    assert_difference('MeRe.count', -1) do
      delete :destroy, id: @me_re
    end

    assert_redirected_to me_res_path
  end
end
