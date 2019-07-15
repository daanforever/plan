class TasksController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index

  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @tasks = current_user.tasks_accessible
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(task_params)

    respond_to do |format|
      if @task.save
        # Plan::Com.new.update(current_user, 'tasks', current_user.tasks_accessible)
        format.json { render :show, status: :created }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      Rails.logger.debug(params)
      new_order = JSON.parse(params.require(:order))
      Rails.logger.debug(new_order)
      if Meta.reorder(user_id: current_user.id, order: new_order)
        format.json { render :index, status: :ok }
      else
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task)
            .permit(:title)
            .merge(user_id: current_user.id)
    end
end
