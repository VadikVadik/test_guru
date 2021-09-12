class SessionsController < ApplicationController
  def new
    console
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      if session[:current_url].nil?
        redirect_to tests_path
      else
        redirect_to session[:current_url]
      end
    else
      flash.now[:alert] = "Are you Guru? Verify your Email and Password please."
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to login_path
  end

end
