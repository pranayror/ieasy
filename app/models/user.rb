class User < ActiveRecord::Base
  
   has_many :bank_statements,:class_name => 'Bank'
   
   acts_as_authentic
   validates_presence_of :company_name,:package_email,:login
   validates_format_of :package_email, :with=>  /^([^\s]+)((?:[-a-z0-9]\.)[a-z]{2,})$/i
end
