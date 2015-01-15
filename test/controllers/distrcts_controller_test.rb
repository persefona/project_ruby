require 'test_helper'

class DistrctsControllerTest < ActionController::TestCase
  setup do
    @distrct = distrcts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:distrcts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create distrct" do
    assert_difference('Distrct.count') do
      post :create, distrct: { ballot: @distrct.ballot, invalid_vote: @distrct.invalid_vote, number: @distrct.number, voter: @distrct.voter }
    end

    assert_redirected_to distrct_path(assigns(:distrct))
  end

  test "should show distrct" do
    get :show, id: @distrct
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @distrct
    assert_response :success
  end

  test "should update distrct" do
    patch :update, id: @distrct, distrct: { ballot: @distrct.ballot, invalid_vote: @distrct.invalid_vote, number: @distrct.number, voter: @distrct.voter }
    assert_redirected_to distrct_path(assigns(:distrct))
  end

  test "should destroy distrct" do
    assert_difference('Distrct.count', -1) do
      delete :destroy, id: @distrct
    end

    assert_redirected_to distrcts_path
  end
end
