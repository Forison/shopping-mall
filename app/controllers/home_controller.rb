class HomeController < ApplicationController
  def index
    @goods = Good.find(1)
  end


  def newsletter 
    @notify=Newsletter.new(newsletter_params)
    if @notify.save 
      flash[:success] = 'we will notify you about new deals' 
      redirect_to root_path
    else
     flash[:danger] = 'could not subscribe'
     redirect_to root_path
    end
  end
  private
  def note_param
    params.require(:notify).permit(:email)
  end
end
