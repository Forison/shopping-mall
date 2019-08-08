class GoodsController < ApplicationController  
  def index
    @categories=Good.pluck("category").uniq
    @goods = Good.order(created_at: :desc)
  end
  def new
    
    @good = Good.new
  end
  def create
    @good = Good.create!(goods_params)
    if @good.save
      flash[:success] = "item stored"
      redirect_back fallback_location: @good
      else
      flash[:warning] = "oops, items could not be added to store"
      redirect_back fallback_location: @good
    end
  end

  def edit
     @good = Good.find(params[:id])
  end

  def show
     @good = Good.find(params[:id])
  end

  def goods_params
     params.require(:good).permit(:name, :brand, :category, :sex, :description, :price, avatar: [])
  end
end
