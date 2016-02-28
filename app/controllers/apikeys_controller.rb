class ApikeysController < ApplicationController
  before_action :user_admin?

  def new
    @apikey = Apikey.new
    @key = generate_token
  end

  def index
    @apikeys = Apikey.all
  end

  def create
    apikey_params
    @apikey = Apikey.new(for: @for,key: @key)
    if @apikey.save
      flash[:notice] = "Saved"
      redirect_to apikeys_path
    else
      flash[:alert] = "Duplicate name for, or duplicate key"
      redirect_to new_apikey_path
    end
  end

  def destroy
    find_apikey
    @apikey.destroy
    redirect_to apikeys_path
  end

  def user_admin
    unless current_user.admin
      flash[:alert] = "**** You shall not pass!!!! ****"
      redirect_to root_path
    end
  end
  private

  def generate_token
    loop do
      token = SecureRandom.urlsafe_base64(36)
      break token unless Apikey.exists?(key: token)
    end
  end

  def find_apikey
    @apikey = Apikey.find params[:id]
  end

  def apikey_params
    @for = params.require(:apikey).permit(:for)[:for]
    @key = params.require(:key)
  end

end
