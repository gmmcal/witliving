require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:cart_items).inverse_of(:user) }

  it { should validate_presence_of(:name) }
end
