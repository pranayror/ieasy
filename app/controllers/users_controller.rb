class UsersController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update,:index]
  
   layout 'user',:except=>:new
 
   
  def index
  end
  
  def new
    @user = User.new
    render :layout=>'application'
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save!
      current_user_session.destroy
      UserProfile.create(:user_id=>@user.id)
      flash[:notice] = "Account registered!"
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
  
    def profile
        @user = current_user
        @user_profile = current_user.user_profile
          if request.post?
            if @user.update_attributes(params[:user])
              @user_profile.update_attributes(params[:user_profile])
            else
              render :action=>'profile'
            end              
          end
    end
  
  def taxes
       @user= current_user
       @user.taxes.build 
  end
  
  def taxes_save
      @user= current_user
      @user.update_attributes(params[:user])
      redirect_to taxes_users_path
  end
  
  def color_logo
      @user_setting= current_user.user_setting.blank? ? UserSetting.new(params[:user_setting]) : current_user.user_setting
  end
  
  def save_settings
      user_setting = UserSetting.new(params[:user_setting])
      user_setting.user_id=current_user.id
      user_setting.save
      redirect_to color_logo_users_path
  end
  
    def update_settings
      user_setting=current_user.user_setting
      user_setting.update_attributes(params[:user_setting])
      redirect_to color_logo_users_path
    end
    
end
