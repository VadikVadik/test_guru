class Admin::GistsController < ApplicationController

  before_action :authenticate_user!

  def index
    @gists = Gist.all
  end

end
