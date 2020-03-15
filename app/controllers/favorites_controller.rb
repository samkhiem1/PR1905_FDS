class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy, :index]
  before_action :load_document, only: :create
  def index
    @favorites = Favorite.all
  end

  def create
    unless current_user.favorited? @document.id
      @favorite = current_user.favorites.build favorite_params
      @favorite.save
    end
  end

  def destroy
    @favorite = Favorite.find_by id: params[:id]
    if @favorite
      @favorite.destroy
    else
      @error_message = "Favorite is not found"
    endFavorite
  end
  private

  def favorite_params
    params.permit(:document_id, :user_id)
  end

  def load_document
    @document = Document.find_by id: params[:document_id]
    if @document.nil?
      flash[:danger] = "document not found"
      redirect_to document_path
    end
  end
end
