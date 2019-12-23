class Admins::DashboardsController < Admins::BaseController
  def index
    @user = User.all
  end
end
