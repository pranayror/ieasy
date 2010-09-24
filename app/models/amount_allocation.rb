class AmountAllocation < ActiveRecord::Base
  belongs_to :bank
  belongs_to :client
  belongs_to :category
  belongs_to :sub_category
end
