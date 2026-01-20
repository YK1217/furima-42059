require 'rails_helper'

RSpec.describe BuyingShipping, type: :model do
  before do
    user =create(:user)
    item = create(:item)

    @buying_shipping = build(:buying_shipping, user_id: user.id, item_id: item.id)
  end
end
