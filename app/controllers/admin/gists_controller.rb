class Admin::GistsController < Admin::AdminController
  def index
    @gists = Gist.all
  end
end
