class Client < ActiveRecord::Base
  belongs_to :user
  has_many :client_contacts
  accepts_nested_attributes_for :client_contacts, :allow_destroy => true
  #attr_accessor :password_confirmation
  
  def contact
  return "#{self.client_contacts.first.first_name}  #{self.client_contacts.first.last_name}"
  end
  
  def email
  return self.client_contacts.first.email
  end
  end