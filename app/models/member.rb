class Member < ApplicationRecord
  has_many :tasks, dependent: :destroy

  def create_task(params)
    tasks.create(params.merge({ status: Task::Status::INCOMPLETE }))
  end
end
