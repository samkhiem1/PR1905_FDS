class Admin::BaseController < ApplicationController
  before_action :check_admin, :user_signed_in?

  private

  def check_admin
    redirect_to(root_url) unless current_user.admin?
    if !current_user.admin?
      flash[:danger] = "Your are not admin"
    end
  end
end
