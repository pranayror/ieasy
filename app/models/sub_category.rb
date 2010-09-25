class SubCategory < ActiveRecord::Base
  belongs_to :category
  acts_as_chainable :select_label => 'SubCategory', :from => :category

end
