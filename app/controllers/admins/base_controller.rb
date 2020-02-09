class Admins::BaseController < ActionController::Base
  before_action :authenticate_admin!
  layout 'admins/admin_layout'
end
