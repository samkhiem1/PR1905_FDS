class Admins::DashboardsController < Admins::BaseController
  def index
    @user = User.all
    @documents = Document.all
  end
end
