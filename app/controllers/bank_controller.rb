include ChainSelectsHelper
require 'parseexcel'
class BankController < ApplicationController
  before_filter :require_user
  map_fields :create, ['transaction_date', 'credit', 'debit', 'description','vendor_client'], :file_field => :xcel_file, :params => [:bank]
  layout 'user'
  def index
    @bank_statement = Bank.find(:first,:order => "updated_at DESC", :limit => 1 )
    #@bank_statement = Bank.find(1)
  end
  
  def new
  end
  
  def create
=begin workbook = Spreadsheet::ParseExcel.parse(params[:xcel_file]) 
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
=end
   if fields_mapped?
        mapped_fields.each do |row|
		if row[1].to_f < 0
		    debit = ((row.at(1).to_f) * -1)
		    amount = debit
		else
		    credit  = row[1].to_f 
		    amount = credit
	    end
          Bank.create(:transaction_date => row[0].to_date,
                               :credit =>debit,
                               :debit => credit,
			       :description=> row[4],
			       :vendor_client=>row[5],
			       :user_id=>current_user.id,
			       :unallocated_mny=>amount)
        end
        flash[:notice] = 'Uploaded successfully'
        redirect_to :action => :list
      else
        render
      end
    rescue MapFields::InconsistentStateError
      flash[:error] = 'Please try again'
      redirect_to :action => :new
    rescue MapFields::MissingFileContentsError
      flash[:error] = 'Please upload a file'
      redirect_to :action => :new
 end
 
 def list
   @bank_statements =current_user.bank_statements
 end
 
 def list_unallocated
   @bank_statements = Bank.find(:all, :conditions=>[" user_id = ? && unallocated_mny != 0", current_user.id])
 end 
 
 def edit_statement
   @statement = Bank.find(params[:id])
   @taxes = current_user.taxes
   @categories = current_user.categories
   @sub_categories = SubCategory.find(:all)
   @clients = current_user.clients
 end
 
 def allocate_money
   allocate_money = AmountAllocation.new(:amount=>params[:amount].to_f,:bank_id=>params[:id],
                            :user_tax_id=>params[:bank][:user_tax].to_i,:category_id=>params[:chain_select][:category].to_i,
                            :sub_category_id=>params[:chain_select][:sub_category].to_i,:client_id=>params[:bank][:client])
   bank = Bank.find(params[:id])
   bank.unallocated_mny = bank.unallocated_mny-params[:amount].to_f
   bank.save!
   allocate_money.save!
   #render :text=>request.params[:chain_select][:category].to_i
   redirect_to :action=>"list_unallocated"
end
  
end
