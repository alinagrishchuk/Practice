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
end
