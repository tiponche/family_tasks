class Members::TasksController < ApplicationController
  before_action :get_member

  def new
    breadcrumbs.add "Add new task"

    @task = Task.new
  end

  def create
    if @member.create_task(create_task_params)
      redirect_to @member
    else
      render :new
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(status: Task::Status::COMPLETE)

    redirect_to @member
  end

  private

  def get_member
    @member = Member.find(params[:member_id])
  end

  def create_task_params
    params.require(:task).permit(:name)
  end
end
