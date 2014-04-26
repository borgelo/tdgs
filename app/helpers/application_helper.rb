module ApplicationHelper
  def textile(text)
    RedCloth.new(html_escape(text)).to_html
  end
end
