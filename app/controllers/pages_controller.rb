class PagesController < ApplicationController
  def home
    @search = Document.search(params[:q])
    @documents = @search.result
  end
end
