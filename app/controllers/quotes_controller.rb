class QuotesController < ApplicationController
  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new quote_params
    if @quote.save
      flash[:notice] = "Saved"
      redirect_to new_quote_path
    else
      flash[:alert] = "See errors below"
      render :new
    end
  end


  private

  def quote_params
    params.require(:quote).permit(:body, :author)
  end


end
