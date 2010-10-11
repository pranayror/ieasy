# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

def remove_child_link(name, f)
f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)")
end

def add_child_link(name, f, method)
fields = new_child_fields(f, method)
link_to_function(name, h("insert_fields(this, \"#{method}\", \"#{escape_javascript(fields)}\")"), :class => 'btn')
end

def new_child_fields(form_builder, method, options = {})
    options[:object] ||= form_builder.object.class.reflect_on_association(method).klass.new
	options[:partial] ||= method.to_s.singularize
	options[:form_builder_local] ||= :f
	form_builder.fields_for(method, options[:object], :child_index => "new_#{method}") do |f|
    render(:partial => options[:partial], :locals => {options[:form_builder_local] => f}) 	
	end
end

def apply_auto_branding(object)
  
	logo_image = (!object.user_setting.blank? && !object.user_setting.logo_file_name.blank?) ? object.user_setting.logo.url(:medium) : "/../images/logo.png"
  
	if !object.user_setting.blank?
    area1color =  !object.user_setting.area1_color.blank? ? object.user_setting.area1_color : "#274D75"
    area2color = !object.user_setting.area2_color.blank? ? object.user_setting.area2_color : "#A1B7CE"
    area3color = !object.user_setting.area3_color.blank? ? object.user_setting.area3_color : "#7295B2"
    
    
	 %Q{
        <style type=\"text/css\">
             .loginuser {background: url(../..#{logo_image}) no-repeat;}
             #myaccount {background: #{area1color};border-bottom:4px solid #{area2color};}
             #sddm li a:hover  {background: #{area2color}}
             #sddm li a  {background: #{area3color}}
             #sddm li a.active {background: #{area2color}}
        </style>
      }
      end
end

end
