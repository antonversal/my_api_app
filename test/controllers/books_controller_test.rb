require 'test_helper'

class BooksControllerTest < ActionController::TestCase
  setup do
    @book = books(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:books)
  end

  test "should create book" do
    assert_difference('Book.count') do
      post :create, book: { belongs_to: @book.belongs_to, name: @book.name, pages: @book.pages }
    end

    assert_response 201
  end

  test "should show book" do
    get :show, id: @book
    assert_response :success
  end

  test "should update book" do
    put :update, id: @book, book: { belongs_to: @book.belongs_to, name: @book.name, pages: @book.pages }
    assert_response 204
  end

  test "should destroy book" do
    assert_difference('Book.count', -1) do
      delete :destroy, id: @book
    end

    assert_response 204
  end
end
