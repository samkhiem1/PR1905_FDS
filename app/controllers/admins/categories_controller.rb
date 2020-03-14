class Admins::CategoriesController < Admins::BaseController
  before_action :find_category, only: [:show, :edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find_by id: params[:id]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "category created"
      redirect_to admins_categories_path
    else
      flash.now[:danger] = "create category failed"
      render 'new'
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = " category deleted"
    else
      flash.now[:danger] = " not be deleted"
    end
    redirect_to admins_categories_path
  end

  def edit
  end

  def update
    if @category.update category_params
      flash[:success] =  "update success"
      redirect_to admins_categories_path
    else
      flash.now[:danger] =  "update fail"
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

  def find_category
    @category = Category.find params[:id]
  end
end
