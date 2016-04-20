require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:item) { Item.create!(name: "New Item") }

  it { is_expected.to belong_to(:user) }

  describe "attributes" do
    it "has a name attribute" do
      expect(item).to have_attributes(name: "New Item")
    end
  end
end
