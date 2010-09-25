class User < ActiveRecord::Base
  
   has_many :bank_statements,:class_name => 'Bank'
   has_one :user_profile
   has_one :user_setting
   has_many :taxes,:class_name =>'UserTax'
   has_many :categories,:class_name =>'Category'
   has_many :clients, :class_name =>'Client'

  accepts_nested_attributes_for :taxes, :allow_destroy => true,
                                            :reject_if => proc { |tax| tax['name'].blank? }
   
   acts_as_authentic
   validates_presence_of :company_name,:package_email
   validates_uniqueness_of :login_page_url
   validates_format_of :package_email, :with=>  /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
end
