class Category < ActiveRecord::Base
  belongs_to:user
  has_many:sub_categories
  acts_as_chainable :to => :sub_category, :root => true
end
