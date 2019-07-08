class TaskStep < ApplicationRecord
  def duration
    end_time = self.stopped? ? self.stopped : Time.now

    return (end_time - self.started).to_i
  end
end
