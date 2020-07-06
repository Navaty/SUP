class WelcomeController < ApplicationController
  def index
  	if (params[:fulsearch] && params[:fulsearch] != "")
  		@task = Task.where("title like ?", "%#{params[:fulsearch]}%")
  	else
  		@task = nil
  		teb = ["tebe", "emu"]
  		@answer = `python lib/assets/python/prediction.py #{teb[0]} #{teb[1]}`

  	end

  
  end
end
