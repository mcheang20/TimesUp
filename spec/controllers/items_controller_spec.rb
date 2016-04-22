require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  let(:my_user) { User.create!(username: "User", email: "user@bloccit.com", password: "helloworld") }
  let(:my_item) { Item.create!(name: "New Item", user: my_user) }

  describe "POST create" do
      it "increases the number of items by 1" do
        expect{ item :create, format: :js, user_id: my_user.id, item: {name: "New Item"} }.to change(Item,:count).by(1)
      end
    end

  describe "DELETE destroy" do
     it "deletes the item" do
        delete :destroy, {id: item.id}

        count = Item.where({id: item.id}).size
        expect(count).to eq 0
     end

     it "redirects to user show" do
        delete :destroy, {id: item.id}

        expect(response).to redirect_to curreny_user
      end
    end
end
