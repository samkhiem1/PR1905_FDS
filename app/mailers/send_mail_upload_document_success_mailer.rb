class SendMailUploadDocumentSuccessMailer < ApplicationMailer

  def send_email document
    @document = document
    mail to: @document.user.email , title: "Email"
  end
end
