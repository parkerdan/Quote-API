class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    @quote = Quote.first
    render json: @quote
  end
end
