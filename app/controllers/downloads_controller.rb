class DownloadsController < ApplicationController
  before_action :authenticate_user!, only: :create
  def create
    @document = Document.find_by id: params[:document_id]
    @download_document = DownloadDocument.new(@document, current_user)
    if @download_document.perform
      send_file("#{Rails.root}/public/#{@document.attachment.url}",
        filename: "#{@document.name}.pdf",
        type: "application/pdf")
      flash[:succes] = @download_document.message
    else
      flash[:danger] = @download_document.message
    end
  end
end
