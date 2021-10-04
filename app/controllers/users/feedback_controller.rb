class Users::FeedbackController < ApplicationController

  before_action :authenticate_user!

  def new
    @user = current_user
  end

  def create
    @user = current_user
    @message = params[:message]
    UsersMailer.feedback(@user, @message).deliver_later
    redirect_to tests_path
  end

end
