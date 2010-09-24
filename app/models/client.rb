class Client < ActiveRecord::Base
  has_many :client_contacts
  accepts_nested_attributes_for :client_contacts, :allow_destroy => true
  #attr_accessor :password_confirmation
  end