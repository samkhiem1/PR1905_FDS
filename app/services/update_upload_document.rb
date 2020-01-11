class UpdateUploadDocument
  attr_accessor :message

  def initialize document, legal
    @document = document
    @user = document.user
    @legal = legal
  end

  def perform
    ActiveRecord::Base.transaction do
      if @legal
        @document.legal!
        update_coin_for_user!
        @message = "Update legal document success."
      else
        @document.illegal!
        update_ban_user!
        @message = "Update illegal document success."
      end
    end
    true
  rescue StandardError
    @message = "Update failed"
    false
  end

  private
  def update_ban_user!
    return if @user.documents.illegal.count < 5
    @user.baned!
  end

  def update_coin_for_user!
    @user.total_coin = @user.total_coin.to_i + 10
    @user.save!
  end
end
