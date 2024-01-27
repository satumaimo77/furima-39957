class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @item = Item.find(params[:item_id])
    return_top_page
    @order_buyer_record = OrderBuyerRecord.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_buyer_record = OrderBuyerRecord.new(order_params)
    if @order_buyer_record.valid?
      pay_item
      @order_buyer_record.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:order_buyer_record).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: Item.find(order_params[:item_id]).price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def return_top_page
    return unless current_user.id == @item.user_id || Order.exists?(item_id: @item.id)

    redirect_to root_path
  end
end
