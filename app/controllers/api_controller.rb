class ApiController < ApplicationController
  protect_from_forgery with: :null_session

  def index
    check_header
    render :json => {
      :status => 200,
      :body => "test",
      :author => @author,
    }
  end
  private

  def check_header
    if request.headers["Author"]
      @author = request.headers["Author"]
    else
      @author = false
    end
  end


end
