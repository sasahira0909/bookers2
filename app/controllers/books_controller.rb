class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @newbook = Book.new
    @user = current_user
  end

  def create
    @newbook = Book.new(book_params)
    @newbook.user_id = current_user.id
    if @newbook.save
        flash[:notice] = 'successfully.'
      redirect_to book_path(@newbook)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def show 
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
       flash[:notice] = 'successfully.'
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit( :title, :body)
  end
end

