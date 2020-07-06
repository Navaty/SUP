class TasksController < ApplicationController
  before_action :authenticate_user!, except: [:index]
	before_action :set_task, only: [:show, :edit, :update, :destroy, :close_task]
  before_action :load_users, only: [:new, :edit, :create]
  before_action :load_project, only:[:new, :edit, :create]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.paginate(page: params[:page], per_page: 5)
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @project = Project.find(@task.project_id)
  end

  # GET /tasks/new
  def new
    #@project = Project.find(params[:project_id])
    @task = Task.new
      end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    a = task_params["project_id"]
   # @task = @project.tasks.create(task_params) БЫЛО ЗАКОМИЧЕНО
 #  rnn_params = task_params[:task]
  # if rnn_params[created_at].wday >5 || rnn_params[created_at].wday<1
   # x_pred[:week] = 1
 #else
 #   x_pred[:week] = 0
  #end
 # if current_user.id == 185 //"Портал"
  #  x_pred[:fos] = 1
   # else
    #x_pred[:fos] = 0
  #end
  #x_pred[:assigned] = rnn_params[assignet_to]
  #x_pred[:Classificator] = rnn_params[project_id]
  #x_pred[:project_id] = Project.find(rnn_params[project_id]).parent_id

  pred = `python lib/assets/python/prediction.py #{a}`
  # task_params[:task][:prediction] = pred.to_f 
    @task = Task.new(task_params)
    @task.created_by = current_user.id
    @task.prediction = pred.to_f

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, success: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, danger: 'I fucked up' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update

    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, success: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, success: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def close_task
    @task.status = true
    if @task.save!
        format.html { redirect_to @task, success: 'Задача закрыта!' }
      else
        format.html { redirect_to @task, success: 'Задача не может быть закрыта.' }
      end
    end

  private
  def load_users
    @user_options = User.all.map{|u| [u.email, u.id]}
  end
  def load_project
    @option_project = Project.all.order(:name)
  end

    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:title, :description, :project_id, :status, :assignet_to)
    end
end
