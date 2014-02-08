module ApplicationHelper
  def flash_messages
    content = []
    if flash[:warning]
      content << content_tag(:div, flash[:warning], class: 'alert alert-danger')
    end

    if flash[:notice]
      content << content_tag(:div, flash[:notice], class: 'alert alert-info')
    end
    content.inject(:<<)
  end
end
