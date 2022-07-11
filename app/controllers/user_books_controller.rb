class UserBooksController < ApplicationController
  before_action :set_user_book, only: %i[ show update destroy ]

  # GET /user_books
  def index
    @user_books = UserBook.all

    render json: @user_books
  end

  # GET /user_books/1
  def show
    render json: @user_book
  end

  # POST /user_books
  def create
    @user_book = UserBook.new(user_book_params)

    if @user_book.save
      render json: @user_book, status: :created, location: @user_book
    else
      render json: @user_book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /user_books/1
  def update
    if @user_book.update(user_book_params)
      render json: @user_book
    else
      render json: @user_book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /user_books/1
  def destroy
    @user_book.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_book
      @user_book = UserBook.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_book_params
      params.require(:user_book).permit(:user_id, :book_id)
    end
end
