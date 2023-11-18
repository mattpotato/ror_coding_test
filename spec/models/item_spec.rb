require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'soft delete' do
    before(:each) do
      @item = Item.create(name: "Example Item", deleted_at: nil)
    end 

    it 'soft deletes an item' do
      @item.soft_delete
      expect(@item.deleted_at).to_not be_nil
    end

    it 'restores a soft-deleted item' do
      @item.soft_delete
      @item.restore
      expect(@item.deleted_at).to be_nil
    end
  end

  describe 'default scope' do
    it 'excludes soft-deleted items from normal queries' do
      item = Item.create(name: "test item 1", deleted_at: nil)
      item.soft_delete
      item2 = Item.create(name: "test item 2", deleted_at: Time.current)
      Item.create(name: "test item 3", deleted_at: nil)
      expect(Item.all).to_not include(item)
      expect(Item.all).to_not include(item2)
    end
  end
end
