require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :project_id => 1,
      :description => "MyString",
      :customer_id => 1,
      :project_id => 1
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input[name=?]", "task[project_id]"

      assert_select "input[name=?]", "task[description]"

      assert_select "input[name=?]", "task[customer_id]"

      assert_select "input[name=?]", "task[project_id]"
    end
  end
end
