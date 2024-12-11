# config/initializers/field_with_errors.rb
ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<input|<textarea|<select/
    # Avoid wrapping input elements with extra div
    html_tag.html_safe
  else
    # Fallback to default behavior for non-input elements
    "<div class=\"field_with_errors\">#{html_tag}</div>".html_safe
  end
end
