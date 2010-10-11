class UserSetting < ActiveRecord::Base
  belongs_to :user
   has_attached_file :logo,
    :styles => {
      :medium => '150>x100',
    }
  has_attached_file :invoice_logo,
    :styles => {
      :medium => '150>x100',
    }
   has_attached_file :quality_logo,
    :styles => {
      :small => '150>x100',
      :medium => '625>x333'
    }
    
    TEMPLATES = {'Clean Template' => 0, 'Classic Template' => 1}
    
    
end
