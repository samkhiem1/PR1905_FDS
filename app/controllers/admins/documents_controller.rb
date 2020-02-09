class Admins::DocumentsController < Admins::BaseController
  def index
    @documents = Document.all
  end

  def update
    @document = Document.find_by id: params[:id]
    unless @document
      flash[:danger] = "Document is not found." and return
    end
    update_upload_document = UpdateUploadDocument.new(@document, params[:legal])
    if update_upload_document.perform
      flash[:success] = update_upload_document.message
    else
      flash[:danger] = update_upload_document.message
    end
  end

  def destroy
    @document = Document.find_by id: params[:id]
    @document.destroy
    flash[:success]= "Document deleted"
    redirect_to admins_documents_path
  end
end
