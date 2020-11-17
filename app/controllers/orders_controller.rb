class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!
  before_action :login_user, only: [:index]
  before_action :sold_out_item, only: [:index]
  def index
    @donation_form = DonationForm.new
  end

  def create
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: donation_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def login_user
    redirect_to root_path if current_user.id == @item.user_id
  end


  def sold_out_item
    redirect_to root_path if @item.purchase.present?
  end
end
