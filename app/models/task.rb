class Task < ApplicationRecord
  module Status
    COMPLETE = 'COMPLETE'.freeze
    INCOMPLETE = 'INCOMPLETE'.freeze
    DELAYED = 'DELAYED'.freeze
  end

  scope :incompleted, -> { where(status: Status::INCOMPLETE) }

  belongs_to :member

  def is_completed?
    status == Status::COMPLETE
  end

  def is_incompleted?
    status == Status::INCOMPLETE
  end
end
