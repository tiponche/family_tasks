class MarkDelayedTaskWorker
  include Sidekiq::Worker
  sidekiq_options queue: "default", retry: false

  def perform
    incompleted_tasks = Task.incompleted

    incompleted_tasks.update_all(status: Task::Status::DELAYED)
  end
end
