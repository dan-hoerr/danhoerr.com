
class HomeController < ApplicationController
  def index
  	@tasks = Task.all
  	@task_types = TaskType.all
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
