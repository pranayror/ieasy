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
                          bank.debit = ((row.at(1).to_f) * -1)
                          bank.unallocated_mny = bank.debit
                        else
                          bank.credit = row.at(1).to_f 
                          bank.unallocated_mny = bank.credit
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
 
 def list_unallocated
   @bank_statements = Bank.find(:all, :conditions=>[" user_id = ? && unallocated_mny != 0", current_user.id])
 end 
 
 def edit_statement
   @statement = Bank.find(params[:id].to_s)
   @taxes = current_user.taxes
   @categories = current_user.categories
   @sub_categories = SubCategory.find(:all)
 end
 
 def allocate_money
   allocate_money = AmountAllocation.new(:amount=>params[:amount].to_f,:bank_id=>params[:id])
   bank = Bank.find(params[:id])
   bank.unallocated_mny = bank.unallocated_mny-params[:amount].to_f
   bank.save!
   allocate_money.save!
   redirect_to :action=>"list_unallocated"
end
  
end
