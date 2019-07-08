require 'rails_helper'

RSpec.describe "tasks/index", type: :view do
  before(:each) do
    assign(:tasks, [
      Task.create!(
        :project_id => 2,
        :description => "Description",
        :customer_id => 3,
        :project_id => 4
      ),
      Task.create!(
        :project_id => 2,
        :description => "Description",
        :customer_id => 3,
        :project_id => 4
      )
    ])
  end

  it "renders a list of tasks" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
