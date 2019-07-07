require 'rails_helper'

RSpec.describe "items/new", type: :view do
  before(:each) do
    assign(:item, Item.new(
      :numfield => 1,
      :textfield => "MyText",
      :title => "MyString"
    ))
  end

  it "renders new item form" do
    render

    assert_select "form[action=?][method=?]", items_path, "post" do

      assert_select "input[name=?]", "item[numfield]"

      assert_select "textarea[name=?]", "item[textfield]"

      assert_select "input[name=?]", "item[title]"
    end
  end
end
