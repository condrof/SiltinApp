module ApplicationHelper
  def flash_messages
    content = []
    if flash[:warning]
      content << content_tag(:div, flash[:warning], class: 'alert alert-danger alert-dismissable')
    end

    if flash[:notice]
      content << content_tag(:div, flash[:notice], class: 'alert alert-info alert-dismissable')
    end
    content.inject(:<<)
  end

  def devise_errors
    return "" if resource.errors.empty?

    content_tag(:div, :class => 'panel panel-danger') do
      content = []
      content << content_tag(:div, :class => 'panel-heading') do
        sentence = I18n.t("errors.messages.not_saved",
                          :count => resource.errors.count,
                          :resource => resource.class.model_name.human.downcase)
        content_tag(:h2, sentence, :class => 'panel-title')
      end
      content << content_tag(:ul, :class => 'list-group') do
        resource.errors.full_messages.map do |message|
          content_tag(:li, message, :class => 'list-group-item')
        end.inject(:<<)
      end
      content.inject(:<<)
    end
  end
end
