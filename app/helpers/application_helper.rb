module ApplicationHelper
  def header(size, text, html_options)
    content_tag(size, text, html_options)
  end
end
