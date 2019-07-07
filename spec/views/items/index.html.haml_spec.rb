require 'rails_helper'

RSpec.describe "items/index", type: :view do
  before(:each) do
    assign(:items, [
      Item.create!(
        :numfield => 2,
        :textfield => "MyText",
        :title => "Title"
      ),
      Item.create!(
        :numfield => 2,
        :textfield => "MyText",
        :title => "Title"
      )
    ])
  end

  it "renders a list of items" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
  end
end
