class GoodsController < ApplicationController  
  def index
    @order = Order.new
    @categories=Good.pluck("category").uniq
    @goods = Good.paginate(page: params[:page])
  end
  def new
    @good = Good.new
  end
  def create
    good = Good.create!(goods_params)
    if good.save
      flash[:success] = "item stored"
      redirect_back fallback_location: good
      else
      flash[:warning] = "oops, items could not be added to store"
      redirect_back fallback_location: good
    end
  end
  
  def show
     @good = Good.find(params[:id])
  end

  def edit
     @good = Good.find(params[:id])
  end

  def update
    good= Good.find(params[:id])
    good.update_attributes(goods_params)
    if good.save 
      flash[:success]="record updated succesfully"
      redirect_back fallback_location: good
    else
      flash[:success]="record updated succesfully"
    end
  end

  def destroy
    good=Good.find_by(params[:id])
    good.destroy
    if good.destroy
    flash[:success]="record updated succesfully"
    redirect_to goods_path
    else
    flash[:success]="item could not be deleted"
    redirect_to goods_path
    end
  end
  private
  def goods_params
     params.require(:good).permit(:name, :brand, :category, :sex, :quantity , :description, :price, avatar: [])
  end
  def order_params
        params.require(:order).permit(:quantity, :user_id, :good_id)
  end
end
