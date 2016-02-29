class UsersController < ApplicationController
  before_action :authenticate_user!

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def create
    @user = User.new user_params
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "All Signed Up! 😊"
      redirect_to root_path
    else
      flash[:alert] = "Oops...something went wrong 😕"
      render :new
    end
  end

  def edit
    @target = User.find params[:id]
    if current_user == @target
      @user = current_user
    else
      @user = @target
    end
  end

  def update

    if current_user.admin
      find_user
      if @user.update user_params
        redirect_to quotes_path, notice: "Profile updated"
      else
        flash[:alert] = "See errors below"
        render :edit
      end
    else
      @user = current_user
      if @user.authenticate(params[:user][:current_password])
        if @user.update user_params
          redirect_to quotes_path, notice: "Profile updated"
        else
          flash[:alert] = "See errors below"
          render :edit
        end
      else
        flash[:alert] = "Wrong password"
        render :edit
      end
    end




  end

  def destroy
    find_user
    @user.destroy
    redirect_to users_path
  end


  private
  def find_user
    @user = User.find params[:id]
  end
  def user_params
    params.require(:user).permit(:user_name, :password, :display_name )
  end


end
