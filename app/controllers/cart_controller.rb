class CartController < ApplicationController
  before_action :load_user

  def index
    @cart_items = @user.cart_items
  end

  private
    def load_user
      @user = User.find(params[:id])
    end
end
