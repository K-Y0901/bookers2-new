class BookCommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    book = Book.find(params[:book_id])
    comment = BookComment.new(comment_params)
    comment.book_id = book.id
    comment.user_id = current_user.id
    comment.save
    redirect_to book_path(book)
    
  end

  def destroy
    @comment = BookComment.find(params[:id])
    @comment.destroy
    redirect_to books_path
  end

  private
  def comment_params
    params.require(:book_comment).permit(:body)
  end
end
