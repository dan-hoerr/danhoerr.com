
class HomeController < ApplicationController
  def index
  	@tasks = Task.all
  	@categories = Category.all
  	@portfolios = Portfolio.all
  	
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @tasks }
    end
  end

  def login
    respond_to do |format|
      format.html
    end
  end
end
