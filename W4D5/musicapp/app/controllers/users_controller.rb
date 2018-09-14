class UsersController < ApplicationController

  # Write methods on the UsersController to allow new users to sign up.
  #    - Users should be logged in immediately after they sign up.

  # empty user, ready for us to add stuff to if ww want to
  def new
    @user = User.new
  end


  def create
    @user = User.new(user_params)
    if user.save!
      login(@user)  # where is the login method? ->
                    # it will be in the ApplicationController class
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
  end


  def show

  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
