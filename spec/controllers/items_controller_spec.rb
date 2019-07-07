require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  before do
    @item = create(:item)
  end

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: @item.id}
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: @item.id}
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Item" do
        expect {
          post :create, params: { item: @item.attributes }
        }.to change(Item, :count).by(1)
      end

      it "redirects to the created item" do
        post :create, params:  { item: @item.attributes }
        expect(response).to redirect_to(Item.last)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      it "updates the requested item" do
        put :update, params: {id: @item.id, item: { textfield: "new test text" }}
        @item.reload
        expect(@item.textfield).to eq "new test text"
      end

      it "redirects to the item" do
        put :update, params:  {id: @item.id, item: @item.attributes }
        expect(response).to redirect_to(@item)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested item" do
      expect {
        delete :destroy, params: {id: @item.id}
      }.to change(Item, :count).by(-1)
    end

    it "redirects to the items list" do
      delete :destroy, params: {id: @item.id}
      expect(response).to redirect_to(items_url)
    end
  end

end
