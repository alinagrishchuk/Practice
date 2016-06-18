module ApplicationHelper
  def bootstrap_class_for(flash_type)
    case flash_type
    when "success"
      "alert-success"
    when "error"
      "alert-danger"
    when "alert"
      "alert-warning"
    when "notice"
      "alert-info"
    else
      flash_type.to_s
    end
  end

  def controller_assets
    controller = params[:controller]
    if  Rails.application.config.controllers_with_assets.include? controller
      javascript_include_tag controller, 'data-turbolinks-track' => true
    end
  end

  def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)", class: "btn btn-default")
  end

  def link_to_add_fields(name,f,association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", f: builder)
    end
    link_to_function(name,"add_fields(this,\"#{association}\", \"#{escape_javascript(fields)}\")")
  end

end
