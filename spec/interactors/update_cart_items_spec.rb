require 'rails_helper'

RSpec.describe UpdateCartItems, type: :interactor do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  let!(:item) { AddItemToCart.call(product: product, user: user) }
  subject(:context) { UpdateCartItems.call(product: product) }

  describe '.call' do
    context 'when price changes' do
      before do
        product.price = 1
      end

      it 'should succeed' do
        expect(context).to be_a_success
      end

      it 'should broadcast :cart_item_price_updated event' do
        expect { context }.to broadcast(:cart_item_price_updated)
      end
    end

    context 'when price do not change' do
      before do
        product.name = 'Foo'
      end

      it 'should succeed' do
        expect(context).to be_a_success
      end

      it 'should not broadcast :cart_item_price_updated event' do
        expect { context }.to_not broadcast(:cart_item_price_updated)
      end
    end
  end
end
