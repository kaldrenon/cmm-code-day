module TasksHelper
  def project_select
    select("task", "project_id", Project.all.collect {|p| [p.title, p.id] })
  end
end
