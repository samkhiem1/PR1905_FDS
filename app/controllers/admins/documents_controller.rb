class Admins::DocumentsController < Admins::BaseController
  def index
    @documents = Document.all
  end

  def update
    @document = Document.find_by id: params[:id]
    if params[:legal]
      @document.legal!
      flash[:success] = "Document legal"
    else
      @document.illegal!
      flash[:success] = "Document illegal"
    end
    redirect_to admins_documents_path
  end

  def destroy
    @document = Document.find(params[:id])
    @document.destroy
    flash[:success]= "Document deleted"
    redirect_to admins_documents_path
  end
end
