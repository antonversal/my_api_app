class BooksController < ApplicationController
  before_filter :assign_user, only: [:create, :index]
  # GET /books
  # GET /books.json
  def index
    @books = @user.books

    render json: @books
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    render json: @book
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(book_params)
    @book.user = @user
    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      head :no_content
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    head :no_content
  end

  private
  def assign_user
    @user = User.find(params[:user_id])
  end

  def book_params
    params.require(:book).permit(:name, :pages)
  end
end
