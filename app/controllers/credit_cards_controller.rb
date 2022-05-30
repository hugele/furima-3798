class CreditCardsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]
  before_action :contributor_confirmation
  before_action :sold_out

  def index
    if current_user.id == @item.user.id|| @item.credit_card.present?
      redirect_to root_path 
    else
      @credit_card_address = CreditCardAddress.new
  end
 end
  def create
    @credit_card_address = CreditCardAddress.new(credit_card_params)
    if @credit_card_address.valid?
      pay_item
      @credit_card_address.save
      return redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def credit_card_params
    params.require(:credit_card_address).permit(:post_number, :prefecture_id, :city, :building, :address, :phone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold_out
    redirect_to root_path if @item.order.present?
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,
      card: credit_card_params[:token],
      currency: 'jpy'              
    )
  end

end

