class Project < ApplicationRecord
  has_many :tasks
  belongs_to :customer

  def total_work_time
    @tasks = Task.where(project_id: self.id)

    @tasks.inject(0) do |d, t|
      d += t.work_time
    end
  end

  def pretty_total_time
    Time.at(total_work_time).utc.strftime("%H:%M")
  end
end
