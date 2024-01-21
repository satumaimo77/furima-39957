class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @order_buyer_record = OrderBuyerRecord.new
  end

  def create
    @order_buyer_record = OrderBuyerRecord.new(order_params)
    if @order_buyer_record.valid?
      @order_buyer_record.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    prams.require(:order_buyer_record).permit(:postal_cade, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id)
  end
end
