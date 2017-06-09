require 'rails_helper'

RSpec.describe AddItemToCart, type: :interactor do
  let(:user) { create(:user) }
  subject(:context) { AddItemToCart.call(product: product, user: user) }

  describe '.call' do
    context 'with valid data' do
      let(:product) { create(:product) }

      it 'should succeed' do
        expect(context).to be_a_success
      end

      it 'should create cart_item' do
        expect(context.cart_item).to_not be_nil
      end

      it 'should broadcast :cart_item_created event' do
        expect { context }.to broadcast(:cart_item_created)
      end
    end

    context 'with invalid data' do
      let(:product) { nil }

      it 'should fail' do
        expect(context).to be_a_failure
      end

      it 'should show errors' do
        expect(context.message).to_not be_nil
      end
    end
  end
end
