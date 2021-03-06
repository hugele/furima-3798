class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show,:edit,:update, :destroy]
  before_action :sold_out,only: [:edit, :update]
  
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end
  
  def show
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id
  end
 

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render action: :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      redirect action: :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :about_item, :category_id, :shipping_cost_id, :condition_id, :prefecture_id, :delivery_day_id, :price).merge(user_id: current_user.id)
  end

  def sold_out
    redirect_to root_path if @item.credit_card.present?
  end

  def set_item
    @item = Item.find(params[:id])
  end
  def move_to_index
    unless user_signed_in?
    redirect_to action: :index
    end
  end

end
