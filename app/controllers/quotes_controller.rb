class QuotesController < ApplicationController
before_action :authenticate_user!
  def new
    @quote = Quote.new
  end

  def index
    @quotes = Quote.all
  end

  def show
    find_quote
  end

  def edit
    find_quote
  end

  def create
    @quote = Quote.new quote_params
    @quote.pirate_speak = TalkLikeAPirate.translate(@quote.body)
    if @quote.save
      flash[:notice] = "Saved"
      redirect_to quote_path(@quote)
    else
      flash[:alert] = "See errors below"
      render :new
    end
  end

  def update
    find_quote
    if @quote.update quote_params
      flash[:notice] = "Updated"
      redirect_to quote_path(@quote)
    else
      render :edit
    end
  end

  def destroy
    find_quote
    @quote.destroy
    redirect_to quotes_path
  end



  private
  def find_quote
    @quote = Quote.find params[:id]
  end

  def quote_params
    params.require(:quote).permit(:body, :author)
  end


end
