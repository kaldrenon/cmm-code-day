require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'create' do
    it 'can be initialized' do
      expect(Item.new).to be_a_new(Item)
    end

    it 'can be saved empty' do
      expect(Item.create).not_to be_a_new(Item)

      expect {
        Item.create
      }.to change(Item, :count).by(1)
    end
  end
end
