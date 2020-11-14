class OrdersController < ApplicationController
  def index
   @donation_form = DonationForm.new
   @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @donation_form = DonationForm.new(donation_params)   
    if @donation_form.valid?
      @donation_form.save
      redirect_to root_path
    else
      render :index
    end
 end

 private
  # 全てのストロングパラメーターを1つに統合
 def donation_params
  params.require(:donation_form).permit(:post_code, :delivery_area_id, :city, :address, :buliding_name, :phone).merge(user_id: current_user.id, item_id: params[:item_id])
 end 

end
