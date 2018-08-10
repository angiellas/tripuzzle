class StaticPagesController < ApplicationController
  def home
    @items = Item.all
    @categories = Category.all
  end

  def about
  end

  def contact
    
  end
  
  def paid
    # redirect_to "/cart/clear"
    flash[:notice] = 'Transaction Complete'
    @order = Order.last
    @order.update_attribute(:status , "Paid by User: #{current_user.email}")
    #"Paid by User:#{current_user.id} #{current_user.name} #{current_user.surname}")
    
  end
  
  def aboutSend
  #@order = Order.find(params[:id])
  #@order.update_attribute(:status, "Paid with Paypal")
  end  
  
  def category
    catName = params[:title]
    @items = Item.where("country like ? ", catName)
  end


end
