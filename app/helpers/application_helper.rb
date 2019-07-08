module ApplicationHelper
  def pretty_time(time)
    Time.at(time).utc.strftime("%H:%M")
  end
end
