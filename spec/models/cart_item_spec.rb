require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it { should belong_to(:user).inverse_of(:cart_items) }
  it { should belong_to(:product).inverse_of(:cart_items) }

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:product) }
  it { should validate_presence_of(:quantity) }
  it { should validate_numericality_of(:quantity).is_greater_than(0) }

  describe '.total' do
    let(:product) { create(:product) }

    it 'should be equal to product price if quantity is 1' do
      cart_item = create(:cart_item, product: product, quantity: 1)
      expect(cart_item.total).to eq(product.price)
    end

    it 'should be equal to product price x quantity' do
      cart_item = create(:cart_item, product: product)
      expect(cart_item.total).to eq(product.price * cart_item.quantity)
    end
  end

  describe '#total' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    it 'should be equal to zero if cart is empty' do
      expect(CartItem.total(user)).to be_zero
    end

    it 'should not be zero if cart is not empty' do
      cart_item = create_list(:cart_item, 5, user: user)
      expect(CartItem.total(user)).to_not be_zero
    end
  end

  describe '#quantity' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    it 'should be equal to zero if cart is empty' do
      expect(CartItem.quantity(user)).to be_zero
    end

    it 'should not be zero if cart is not empty' do
      cart_item = create_list(:cart_item, 5, user: user)
      expect(CartItem.quantity(user)).to_not be_zero
    end
  end

  describe '#pending' do
    let(:user) { create(:user) }
    let(:product) { create(:product) }

    it 'should be equal to zero if cart is empty' do
      expect(CartItem.pending).to be_zero
    end

    it 'should not be zero if cart is not empty' do
      cart_item = create_list(:cart_item, 5, user: user)
      expect(CartItem.pending).to_not be_zero
    end
  end
end
