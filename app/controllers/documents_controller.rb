class DocumentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :new]
  def index
    @documents = Document.includes(:user).all
  end

  def show
    @document = Document.includes(comments: :user).find(params[:id])
  end

  def new
    @document = current_user.documents.build
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @document = current_user.documents.build(document_params)
    if disallow_upload?
      flash.now[:danger] = "You has been uploaded 10 documents in this month."
      render "new" and return
    end
    if @document.save
      UpdateThumbnailWorker.perform_at(0, @document.id)
      SendEmailForUploadDocumentSuccessWorker.perform_at(0, @document.id)
      flash[:success]= "Successfully uploaded."
      redirect_to documents_path
    else
      flash.now[:danger] = "Upload failed"
      render "new"
    end
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:success]= "Document deleted"
    redirect_to documents_path
  end
private
  def document_params
    params.require(:document).permit(:name, :attachment, :description, :status, :category_id)
  end

  def disallow_upload?
    current_user.documents.created_in_month.legal.count > 10
  end
end
