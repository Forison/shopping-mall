class GoodsController < ApplicationController  
  def index
    @goods = Good.order(created_at: :desc)
  end
  def new
    @good = Good.new
  end
  def create
    @good = Good.new( goods_params )
    if @good.save
      flash[:success] = "item has been added to store"
      redirect_to root_path
      else
      flash[:warning] = "oops, items could not be added to store"
      redirect_to root_path
    end
  end

  def edit
     @good = Good.find(params[:id])
  end

  def show
     @good = Good.find(params[:id])
  end

  def goods_params
     params.require(:good).permit(:name, :brand, :category, :sex, :description, :price)
  end
end
