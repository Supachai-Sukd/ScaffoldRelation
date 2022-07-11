require "test_helper"

class UserBooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_book = user_books(:one)
  end

  test "should get index" do
    get user_books_url, as: :json
    assert_response :success
  end

  test "should create user_book" do
    assert_difference("UserBook.count") do
      post user_books_url, params: { user_book: { book_id: @user_book.book_id, user_id: @user_book.user_id } }, as: :json
    end

    assert_response :created
  end

  test "should show user_book" do
    get user_book_url(@user_book), as: :json
    assert_response :success
  end

  test "should update user_book" do
    patch user_book_url(@user_book), params: { user_book: { book_id: @user_book.book_id, user_id: @user_book.user_id } }, as: :json
    assert_response :success
  end

  test "should destroy user_book" do
    assert_difference("UserBook.count", -1) do
      delete user_book_url(@user_book), as: :json
    end

    assert_response :no_content
  end
end
