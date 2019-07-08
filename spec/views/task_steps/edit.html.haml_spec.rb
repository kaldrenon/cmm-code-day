require 'rails_helper'

RSpec.describe "task_steps/edit", type: :view do
  before(:each) do
    @task_step = assign(:task_step, TaskStep.create!(
      :task_id => 1
    ))
  end

  it "renders the edit task_step form" do
    render

    assert_select "form[action=?][method=?]", task_step_path(@task_step), "post" do

      assert_select "input[name=?]", "task_step[task_id]"
    end
  end
end
