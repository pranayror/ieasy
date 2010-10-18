class ItemsController < ApplicationController
   layout 'user'
  before_filter :require_user
   def new
      @item = Item.new            
    end  
    
    def create     
      #render :text => params.inspect and return
      @item = Item.new(params[:item])         
      @item.save ? (redirect_to :controller => params[:commit] == "Save & Add Another" ? "/items/new" : "items"): (render :action => :new)
   end
   
end
