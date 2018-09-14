class SessionsController < ApplicationController

  # Create a SessionsController but no Session model.
  #
  #   - Write controller methods and the accompanying routes so that users
  #     can log in and log out. Should session be a singular resource?
  #   - SessionsController#create should re-set the appropriate user's
  #     session_token and session[:session_token].
  #   - For now just redirect them to a User#show page which simply displays
  #     that user's email.


  def new

  end

  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    if user
      login(user)
    else
      flash.now[:errors] = "Not acceptable email/password"
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
