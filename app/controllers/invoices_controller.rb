class InvoicesController < ApplicationController
  layout 'user'
  before_filter :require_user
  
  
  def new
    @invoice = Invoice.new      
    end
end
