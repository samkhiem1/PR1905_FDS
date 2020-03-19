class Admins::StaticsController < Admins::BaseController
  def index
    @documents = Document.all
    @downloads = Download.all
  end
end
