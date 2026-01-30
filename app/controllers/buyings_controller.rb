class BuyingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :redirect_if_seller
  before_action :redirect_if_sold_out

  def index
    gon.public_key = ENV.fetch("PAYJP_PUBLIC_KEY")
    @buying_shipping = BuyingShipping.new
  end

  def create
    @buying_shipping = BuyingShipping.new(buying_shipping_params)

    if @buying_shipping.valid?
      pay_item
      @buying_shipping.save
      redirect_to root_path, notice: "購入が完了しました"
    else
      gon.public_key = ENV.fetch("PAYJP_PUBLIC_KEY")
      flash.now[:payjp_error] = nil
      @buying_shipping.token = nil
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_seller
    redirect_to root_path if current_user.id == @item.user_id
  end

  def redirect_if_sold_out
    redirect_to root_path if @item.buying.present?
  end

  def buying_shipping_params
    params.require(:buying_shipping).permit(:postcode, :area_id, :city, :address, :building, :phone, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV.fetch("PAYJP_SECRET_KEY")

    Payjp::Charge.create(amount: @item.price, card: buying_shipping_params[:token], currency: "jpy")
  end
end
