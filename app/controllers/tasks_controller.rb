class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :get_category

  # GET /tasks or /tasks.json
  def index
    # @tasks = Task.all
    @tasks = @category.tasks
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task = Task.find(params[:id])
  end

  # GET /tasks/new
  def new
    # @task = Task.new
    @task = @category.tasks.build

  end

  # GET /tasks/1/edit
  def edit
    @tasks = Task.find(params[:id])
  end

  # POST /tasks or /tasks.json
  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to category_task_path(@category.id, @task.id)
    end

  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task = Task.find(params[:id]).destroy
    redirect_to category_path(@category.id)
    # @task.destroy
    # respond_to do |format|
    #   format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private

    def get_category
      @category = Category.find(params[:category_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.fetch(:task, {}).permit(:name, :details, :scheduled_at, :category_id)
    end
end
