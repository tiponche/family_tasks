class Task < ApplicationRecord
  module Status
    COMPLETE = 'COMPLETE'.freeze
    INCOMPLETE = 'INCOMPLETE'.freeze
    DELAYED = 'DELAYED'.freeze
  end

  belongs_to :member

  def is_completed?
    status == Status::COMPLETE
  end
end
