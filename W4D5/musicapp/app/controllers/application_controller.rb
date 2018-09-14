class ApplicationController < ActionController::Base

# Finally, take some time to refactor out shared code & add some convenience
# methods to ApplicationController. Make sure to include the appropriate
# methods in your views as helper methods (e.g. helper_method :current_user).
# You'll probably want:
#
#   - current_user to return the current user.
#   - logged_in? to return a boolean indicating whether someone is signed in.
#   - log_in_user!(user) reset the users session token and cookie


  def login(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end


  def current_user
   @current_user ||= User.find_by_session_token(session[:session_token])
  end


  def logged_in?
    !!current_user
  end

  # not sure if this is needed but it seems logical to have it
  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

end
