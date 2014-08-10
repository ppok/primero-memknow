require 'test_helper'

class MemsControllerTest < ActionController::TestCase
  setup do
    @mem = mems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mem" do
    assert_difference('Mem.count') do
<<<<<<< HEAD
      post :create, mem: { answer: @mem.answer, question: @mem.question, score: @mem.score }
=======
      post :create, mem: { description: @mem.description }
>>>>>>> c15ef2af56191c136dd43567be094b0f55d02f85
    end

    assert_redirected_to mem_path(assigns(:mem))
  end

  test "should show mem" do
    get :show, id: @mem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mem
    assert_response :success
  end

  test "should update mem" do
<<<<<<< HEAD
    patch :update, id: @mem, mem: { answer: @mem.answer, question: @mem.question, score: @mem.score }
=======
    patch :update, id: @mem, mem: { description: @mem.description }
>>>>>>> c15ef2af56191c136dd43567be094b0f55d02f85
    assert_redirected_to mem_path(assigns(:mem))
  end

  test "should destroy mem" do
    assert_difference('Mem.count', -1) do
      delete :destroy, id: @mem
    end

    assert_redirected_to mems_path
  end
end
