class ClientsController < ApplicationController
  layout 'user'
  before_filter :require_user
  before_filter :get_client,  :only =>[:edit, :update]
  
  def index
  @clients = Client.all
  end
  
  def new
      @client = Client.new      
      @client.client_contacts.build      
    end  
    
    def create
      #render :text => params.inspect and return
     @client = Client.new(params[:client])
     @client.save ? (redirect_to :controller => "clients") : (render :action => :new)
   end
     
   def update
     @client.update_attributes(params[:client]) ? (redirect_to :controller => "clients") : (render :action => :edit, :id => params[:id])
     
   end
   
   private
   def get_client
     @client = Client.find(params[:id])
     end
end
