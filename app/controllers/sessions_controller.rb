class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_user_name params[:user_name]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to quotes_path
      flash[:notice] = "Logged In 🤗"
    else
      flash[:alert] = "**** You shall not pass!!!! ****"
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password)
  end

end
