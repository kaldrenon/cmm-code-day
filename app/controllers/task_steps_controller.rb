class TaskStepsController < ApplicationController
  before_action :set_task_step, only: [:show, :edit, :update, :destroy]

  # GET /task_steps
  # GET /task_steps.json
  def index
    @task_steps = TaskStep.all
  end

  # GET /task_steps/1
  # GET /task_steps/1.json
  def show
  end

  # GET /task_steps/new
  def new
    @task_step = TaskStep.new(task_id: params[:task_id])
  end

  # GET /task_steps/1/edit
  def edit
  end

  # POST /task_steps
  # POST /task_steps.json
  def create
    @task_step = TaskStep.new(task_step_params)

    respond_to do |format|
      if @task_step.save
        format.html { redirect_to @task_step, notice: 'Task step was successfully created.' }
        format.json { render :show, status: :created, location: @task_step }
      else
        format.html { render :new }
        format.json { render json: @task_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /task_steps/1
  # PATCH/PUT /task_steps/1.json
  def update
    respond_to do |format|
      if @task_step.update(task_step_params)
        format.html { redirect_to @task_step, notice: 'Task step was successfully updated.' }
        format.json { render :show, status: :ok, location: @task_step }
      else
        format.html { render :edit }
        format.json { render json: @task_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /task_steps/1
  # DELETE /task_steps/1.json
  def destroy
    @task_step.destroy
    respond_to do |format|
      format.html { redirect_to task_steps_url, notice: 'Task step was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task_step
      @task_step = TaskStep.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_step_params
      params.require(:task_step).permit(:task_id, :started, :stopped)
    end
end
