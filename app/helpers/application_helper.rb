module ApplicationHelper
  def textile(text)
    RedCloth.new(html_escape(text)).to_html
  end
  
  # Returns the full title on a per-page basis.
    def full_title(page_title)
      base_title = "Tromsø Dannede Gourmet Selskab"
      if page_title.empty?
        base_title
      else
        "#{base_title} | #{page_title}"
      end
    end
end
