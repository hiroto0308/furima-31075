class OrdersController < ApplicationController
  def index
   @donation_form = DonationForm.new
   @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @donation_form = DonationForm.new(donation_params)   
    if @donation_form.valid?
      pay_item
      @donation_form.save
      redirect_to root_path
    else
      render :index
    end
 end

 private
  # 全てのストロングパラメーターを1つに統合
 def donation_params
  params.require(:donation_form).permit(:post_code, :delivery_area_id, :city, :address, :buliding_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
 end 

 def pay_item
  Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  Payjp::Charge.create(
    amount: @item.price,
    card: donation_params[:token],    
    currency: 'jpy'                 
  )
 end 
end
