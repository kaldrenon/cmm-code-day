module ProjectsHelper
  def customer_select
    select("project", "customer_id", Customer.all.collect {|c| [c.name, c.id] })
  end
end
