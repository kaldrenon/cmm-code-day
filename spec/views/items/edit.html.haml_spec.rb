require 'rails_helper'

RSpec.describe "items/edit", type: :view do
  before(:each) do
    @item = assign(:item, Item.create!(
      :numfield => 1,
      :textfield => "MyText",
      :title => "MyString"
    ))
  end

  it "renders the edit item form" do
    render

    assert_select "form[action=?][method=?]", item_path(@item), "post" do

      assert_select "input[name=?]", "item[numfield]"

      assert_select "textarea[name=?]", "item[textfield]"

      assert_select "input[name=?]", "item[title]"
    end
  end
end
