require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:item) { Item.create!(name: "New Item") }

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end


  describe "POST create" do
      it "increases the number of Item by 1" do
        expect{ item :create, item_id: my_item.id, item: {name: "New Item"} }.to change(Item,:count).by(1)
      end
    end


end
