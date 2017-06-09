class ProductsController < ApplicationController
  before_action :load_user
  before_action :load_product, except: [:index]

  def index
    @products = Product.all
  end

  def show
  end

  def add
    result = AddItemToCart.call(product: @product, user: @user)
    if result.success?
      redirect_to cart_user_path(@user), notice: 'Item added to the cart'
    else
      redirect_to user_product_path(@user, @product), alert: 'Failed to add item to cart'
    end
  end

  def delete
    result = RemoveItemFromCart.call(product: @product, user: @user)
    if result.success?
      redirect_to cart_user_path(@user), notice: 'Item removed to the cart'
    else
      redirect_to user_product_path(@user, @product), alert: 'Failed to remove item to cart'
    end
  end

  private
    def load_user
      @user = User.find(params[:user_id])
    end

    def load_product
      @product = Product.find(params[:id])
    end
end
