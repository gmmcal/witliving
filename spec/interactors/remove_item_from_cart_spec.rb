require 'rails_helper'

RSpec.describe RemoveItemFromCart, type: :interactor do
  let(:user) { create(:user) }
  let(:product) { create(:product) }
  subject(:context) { RemoveItemFromCart.call(product: product, user: user) }

  describe '.call' do
    context 'with valid data' do
      let!(:item) { AddItemToCart.call(product: product, user: user) }

      it 'should succeed' do
        expect(context).to be_a_success
      end

      it 'should broadcast :cart_item_removed event' do
        expect { context }.to broadcast(:cart_item_removed)
      end
    end

    context 'with invalid data' do
      it 'should fail' do
        expect(context).to be_a_failure
      end

      it 'should show errors' do
        expect(context.message).to_not be_nil
      end
    end
  end
end
