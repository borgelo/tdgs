require 'test_helper'

class ReInsControllerTest < ActionController::TestCase
  setup do
    @re_in = re_ins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:re_ins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create re_in" do
    assert_difference('ReIn.count') do
      post :create, re_in: { ingredient_id: @re_in.ingredient_id, recipe_id: @re_in.recipe_id }
    end

    assert_redirected_to re_in_path(assigns(:re_in))
  end

  test "should show re_in" do
    get :show, id: @re_in
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @re_in
    assert_response :success
  end

  test "should update re_in" do
    patch :update, id: @re_in, re_in: { ingredient_id: @re_in.ingredient_id, recipe_id: @re_in.recipe_id }
    assert_redirected_to re_in_path(assigns(:re_in))
  end

  test "should destroy re_in" do
    assert_difference('ReIn.count', -1) do
      delete :destroy, id: @re_in
    end

    assert_redirected_to re_ins_path
  end
end
