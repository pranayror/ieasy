class ClientsController < ApplicationController
  layout 'user'
  before_filter :require_user
  before_filter :get_client,  :only =>[:edit, :update, :show]
  
  def index
    @search = Client.search(params[:search])
    if params[:search] && !params[:search].blank?
     
       @clients = @search.all
       else
      #~ render :text => @clients.inspect and return
  @clients = current_user.clients
  end
  end
  
  def new
      @client = Client.new      
      @client.client_contacts.build      
    end  
    
    def create
      #render :text => params.inspect and return
     @client = Client.new(params[:client])
     @client.user_id = current_user.id
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
