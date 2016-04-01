class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(session_params)

    if @user
      login_user!(@user)
    else
      flash[:errors] = ["Invalid credentials"]
      render :new
    end
  end

  def destroy
    logout_user!
  end

  private
  def session_params
    params.require(:user).permit(:username,:password)
  end
end
