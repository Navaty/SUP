class ReportController < ApplicationController
  def index
  	@projects = Project.all
  	@task = Task.all
  end
  def show
  end
end
