class ProjectRolesController < ApplicationController
	  def new
    @role = ProjectRole.new
  end

  # POST /projects
  # POST /projects.json
  def create
    @role = ProjectRole.new(projectrole_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end
end
