  require 'parseexcel'
class BankController < ApplicationController
  before_filter :require_user
  layout 'user'
  def index
  end
  
  def new
  end
  
  def create
  workbook = Spreadsheet::ParseExcel.parse(params[:xcel_file]) 
   worksheet = workbook.worksheet(0)
 
 
  worksheet.each(0) { |row|
                    bank = Bank.new
                    bank.user_id = current_user.id
                    bank.transaction_date = row.at(0).date
                        if row.at(1).to_f < 0
                          bank.debit = row.at(1).to_f
                        else
                          bank.credit = row.at(1).to_f 
                        end
                    bank.description = row.at(4).to_s('latin1') if row.at(4) != nil
                    bank.vendor_client = row.at(5).to_s('latin1') if row.at(5) != nil                   
                    bank.save
  }
   redirect_to :action => :list
 end
 
 def list
   @bank_statements =current_user.bank_statements
   end
  
end
