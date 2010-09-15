class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update,:index]
  
  def index
    render :layout =>'user'
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
       current_user_session.destroy
      flash[:notice] = "Account registered!"
      #redirect_to root_url
      redirect_to find_domains_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = @current_user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"
      redirect_to account_url
    else
      render :action => :edit
    end
  end

  def checkdomain
    user = User.find_by_login_page_url(params[:domain])
    !user.blank? ? "#{render :text => true}"  : "#{render :text => false}"
    end
  
end
