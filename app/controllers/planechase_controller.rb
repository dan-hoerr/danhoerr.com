require 'open-uri'

class PlanechaseController < ApplicationController

	def index
    	@planes = Planes.all

    	respond_to do |format|	
      		format.html # index.html.erb
      		format.json { render :json => @planes }
    	end
  	end #end index

  	def random
  		@plane = Planes.random_record
  		respond_to do |format|
  			format.html
  			format.json { render :json => @plane }
  		end
  	end

  	def update_database
  		@planes = Planes.update_planes
  		respond_to do |format|
  			format.json { render :json => @planes }
  		end
  	end
end # end controller
