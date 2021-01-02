class SubtasksController < ApplicationController
  before_action :find_task, only: %i[new create edit]
  before_action :set_subtask, only: %i[edit update destroy]

  def new
    @subtask = Subtask.new
  end

  def create
    @subtask = Subtask.new(subtask_params)
    @subtask.task = @task
    if @subtask.save
      redirect_to tasks_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @subtask.update(subtask_params)
    redirect_to tasks_path
  end

  def destroy
    @subtask.destroy
    redirect_to tasks_path
  end

  private

  def set_subtask
    @subtask = Subtask.find(params[:id])
  end

  def find_task
    @task = Task.find(params[:task_id])
  end

  def subtask_params
    params.require(:subtask).permit(:content)
  end
end
