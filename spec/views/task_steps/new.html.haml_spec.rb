require 'rails_helper'

RSpec.describe "task_steps/new", type: :view do
  before(:each) do
    assign(:task_step, TaskStep.new(
      :task_id => 1
    ))
  end

  it "renders new task_step form" do
    render

    assert_select "form[action=?][method=?]", task_steps_path, "post" do

      assert_select "input[name=?]", "task_step[task_id]"
    end
  end
end
