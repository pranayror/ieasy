class ClientsController < ApplicationController
  layout 'user'
  before_filter :require_user
  before_filter :get_client,  :only =>[:edit, :update, :show]
  
  def index
    @search = Client.search(params[:search])
    if params[:search] && !params[:search].blank?
     
       @clients = @search.all(:conditions=>["deleted LIKE ?",0])
       else
      #~ render :text => @clients.inspect and return
  @clients = current_user.clients.find(:all,:conditions=>["deleted LIKE ?",0])
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
   
   def update_status
       if !params[:selected_client].blank?
         for selectedclient in params[:selected_client]
            client = Client.find(:first,:conditions=>["id LIKE ?",selectedclient])
            client.update_attributes(params[:status].to_sym => 1)
         end
       end
    redirect_to '/clients'
   end
   
   
   private
   def get_client
     @client = Client.find(params[:id])
     end
end
