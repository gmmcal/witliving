require 'rails_helper'

RSpec.describe ExpireCartItems, type: :interactor do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let!(:item) { AddItemToCart.call(product: product, user: user) }
  subject(:context) { ExpireCartItems.call }

  describe '.call' do
    context 'with items added less than 2 days ago' do

      it 'should succeed' do
        expect(context).to be_a_success
      end

      it 'should not remove item' do
        expect(CartItem.all).to include(item.cart_item)
      end
    end

    context 'with items added more than 2 days ago' do
      before do
        Timecop.freeze(Time.now + 3.days)
      end

      after do
        Timecop.return
      end

      it 'should succeed' do
        expect(context).to be_a_success
      end

      it 'should remove item' do
        # clear query cache before verify if data is gone
        ActiveRecord::Base.clear_all_connections!
        expect(CartItem.all).to_not include(item.cart_item)
      end

      it 'should broadcast :cart_item_expired event' do
        expect { context }.to broadcast(:cart_item_expired)
      end
    end
  end
end
