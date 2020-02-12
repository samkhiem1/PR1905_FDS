class FriendshipsController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @friends = Friendship.all
  end

  def show
    @friendship = Friendship.find_by id: params[:id]
  end

  def create
    @friendship = current_user.friendships.build(friend_id: params[:friend_id])
    if @friendship.save
      flash[:notice] = "Add friend."
      redirect_to friendships_path
    else
      flash[:error] = "Unable to add friend."
      redirect_to friendships_path
    end
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.accept!
    flash[:success] = "You add friend with #{@friendship.user.username}."
    redirect_to friendships_path
  end

  def destroy
    @friendship = Friendship.find(params[:id])
    @friendship.destroy
    flash[:notice] = "Removed friendship."
    redirect_to friendships_path
  end
end
