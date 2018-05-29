class WelcomeController < ApplicationController
  def index
  	if (params[:fulsearch] && params[:fulsearch] != "")
  		@task = Task.where("title like ?", "%#{params[:fulsearch]}%")
  	else
  		@task = nil
  	end

  
  end
end
