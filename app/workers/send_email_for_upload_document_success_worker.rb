class SendEmailForUploadDocumentSuccessWorker
  include Sidekiq::Worker

  def perform(document_id)
    @document = Document.find document_id
    SendMailUploadDocumentSuccessMailer.send_email(@document).deliver
  end
end
