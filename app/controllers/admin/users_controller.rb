class Admin::UsersController < Admin::BaseController
  before_action :check_admin, :user_signed_in?, :load_user
  def index
    @users = User.all
  end

  def edit
  end

  def update
    @user.update admin: user_params[:admin]
    if @user.admin?
      flash[:success] = "#{@user.email} is admin! "
    else
      flash[:success] = "#{@user.email} is normal user! "
    end
    redirect_to admin_users_path
  end

  def destroy
    @user.destroy
    flash[:success] = "deleted"

    redirect_to admin_users_path
  end

  private

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:admin)
  end
end
