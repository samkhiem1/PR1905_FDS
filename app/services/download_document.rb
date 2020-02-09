class DownloadDocument
  attr_accessor :message

  def initialize document, user
    @document = document
    @user = user
    @document_user = document.user
    @message = ""
  end

  def perform
    ActiveRecord::Base.transaction do
      begin
        if download_free_in_this_month
          Download.create(user: @user, document: @document)
          @message = "#{3 - @document.downloads.count} download free remains."
        elsif charges_downloading
          Download.create(user: @user, document: @document)
          @message = "Download document success."
        else
          @message = "download document fail."
          false
        end
      rescue StandardError
        @message = "download fail."
        false
      end
    end
  end

  private
  def download_free_in_this_month
    return false if @user.check_user_download > 2
  end

  def charges_downloading
    return false if @user.total_coin.to_i < 10
    if @user != @document_user
      @user.update(total_coin: @user.total_coin.to_i - 10)
      @document_user.update(total_coin: @document_user.total_coin.to_i + 1)
    else
      @document_user.update(total_coin: @document_user.total_coin.to_i + 0)
    end
  end
end
