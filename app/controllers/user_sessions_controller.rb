class UserSessionsController < ApplicationController
   before_filter :require_user, :only => :destroy
  
  def new
     @user_session = UserSession.new
   end
  

  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = "Login successful!"
      redirect_to "/users/index"
    else
      render :action => :new
    end
  end
  
  def find_domains
     if request.post? 
       @pages = User.find(:all, :conditions => ["package_email like ?",params[:email].to_s])
      flash[:error] = "Sorry, no login pages found"    if @pages.blank?
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = "Logout successful!"
    redirect_back_or_default new_user_session_url
  end
end
