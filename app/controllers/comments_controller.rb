class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :load_document
  def create
    @comment = @document.comments.new comment_params
    @comment.user = current_user
    @comment.document_id = @document.id
    @result = @comment.save
  end

  def destroy
    @comment = Comment.find_by id: params[:id]
    if @comment
      @comment.destroy
    else
      @error_message = "Comment is not found"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def load_document
    @document = Document.find_by id: params[:document_id]
    if @document.nil?
      flash[:danger] = "document not found"
      redirect_to document_path
    end
  end
end
