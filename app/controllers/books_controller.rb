class BooksController < ApplicationController
  def top
    
  end

  def index
      @books = Book.all
      @book = Book.new
  end

  def show
      @book = Book.find(params[:id])
  end

  def new
      @book = Book.new
  end

  def edit
      @book = Book.find(params[:id])
  end

  def create
      @book = Book.new(book_params)
      if @book.save #保存する
        flash[:success] = 'Book was successfully created.'
        redirect_to book_path(@book) #ブックス画面へリダイレクト
      else
        @books = Book.all
        p @book.errors
        render :index
      end
  end

  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = 'Book was successfully Update.'
        redirect_to book_path(@book.id)
      else
        render :edit
      end
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
