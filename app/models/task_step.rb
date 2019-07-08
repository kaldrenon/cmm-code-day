class TaskStep < ApplicationRecord
  belongs_to :task
  validate :ends_after_start
  validates :started, presence: true

  def ends_after_start
    if (started && stopped) && (started > stopped)
      errors.add(:stopped, "must be after start time")
    end
  end

  def duration
    end_time = self.stopped? ? self.stopped : Time.now

    return (end_time - self.started).to_i
  end
end
