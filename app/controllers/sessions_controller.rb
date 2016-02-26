class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_user_name params[:user_name]
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to new_quote_path
      flash[:notice] = "Logged In 🤗"
    else
      flash[:alert] = "**** You shall not pass!!!! ****"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, flash[:notice] = "Logged out!"
  end

  private

  def user_params
    params.require(:user).permit(:user_name, :password, :password_confirmation)
  end

end