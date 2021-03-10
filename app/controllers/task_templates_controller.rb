class TaskTemplatesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_task_template, only: %i[show edit update destroy create_task_from_template]

  def index
    @task_templates = TaskTemplate.where(user: current_user)
  end

  def show; end

  def new
    @task_template = TaskTemplate.new
  end

  def create
    @task_template = TaskTemplate.new(task_template_params)
    params[:task_template][:subtasks].split(";").each do |subtask|
      @task_template.subtasks << subtask
    end
    @task_template.user = current_user
    if @task_template.save
      redirect_to task_templates_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @task_template.update(task_template_params)
      redirect_to task_templates_path
    else
      render :edit
    end
  end

  def destroy
    @task_template.destroy
    redirect_to task_templates_path
  end

  def create_task_from_template
    task = Task.create(title: @task_template.title, category: @task_template.category, user: current_user)
    @task_template.subtasks.each do |subtask_template|
      subtask = Subtask.new(content: subtask_template)
      subtask.task_id = task.id
      subtask.save
    end
    redirect_to tasks_path
  end

  private

  def set_task_template
    @task_template = TaskTemplate.find(params[:id] || params[:task_template_id])
  end

  def task_template_params
    params.require(:task_template).permit(:title, :category)
  end
end
