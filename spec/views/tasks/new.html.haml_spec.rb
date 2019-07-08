require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :project_id => 1,
      :description => "MyString",
      :customer_id => 1,
      :project_id => 1
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input[name=?]", "task[project_id]"

      assert_select "input[name=?]", "task[description]"

      assert_select "input[name=?]", "task[customer_id]"

      assert_select "input[name=?]", "task[project_id]"
    end
  end
end
