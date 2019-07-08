class TaskStep < ApplicationRecord
  def duration
    end_time = self.stopped? ? self.stopped : Time.now
    puts end_time

    return end_time - self.started
  end
end
