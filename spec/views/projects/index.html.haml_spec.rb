require 'rails_helper'

RSpec.describe "projects/index", type: :view do
  before(:each) do
    assign(:projects, [
      Project.create!(
        :customer_id => 2,
        :title => "Title"
      ),
      Project.create!(
        :customer_id => 2,
        :title => "Title"
      )
    ])
  end

  it "renders a list of projects" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
