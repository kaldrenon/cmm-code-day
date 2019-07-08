require 'rails_helper'

RSpec.describe "task_steps/index", type: :view do
  before(:each) do
    assign(:task_steps, [
      TaskStep.create!(
        :task_id => 2
      ),
      TaskStep.create!(
        :task_id => 2
      )
    ])
  end

  it "renders a list of task_steps" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
