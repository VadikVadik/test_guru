class Users::FeedbacksController < ApplicationController

  before_action :authenticate_user!

  def new

  end

  def create
    @message = params[:message]
    UsersMailer.feedback(current_user, @message).deliver_later
    redirect_to tests_path
  end

end
