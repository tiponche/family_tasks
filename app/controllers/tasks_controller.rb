class TasksController < ApplicationController
  def index
    breadcrumbs.add "Tasks"

    @tasks = Task.all.paginate(per_page: 2, page: params[:page])
  end

  def new
    breadcrumbs.add "Add new task"

    @task = Task.new
  end

  def create
    member = Member.find_by(id: create_task_params[:member_id])

    if member.create_task(create_task_params)
      redirect_to tasks_path
    else
      render :new
    end
  end

  def update
    task = Task.find_by(id: params[:id])
    task.update(status: Task::Status::COMPLETE)

    redirect_to tasks_path
  end

  def destroy_all
    Task.destroy_all

    redirect_to root_path
  end

  private

  def create_task_params
    params.require(:task).permit(:name, :member_id)
  end
end
