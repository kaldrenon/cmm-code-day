class Task < ApplicationRecord
  has_many :task_steps
  belongs_to :project
  belongs_to :user

  def work_time
    @task_steps = TaskStep.where(task_id: self.id)

    duration = @task_steps.inject(0) do |d, ts|
      d += ts.duration
    end

    return duration
  end

  def pretty_time
    Time.at(work_time).utc.strftime("%H:%M")
  end
end
