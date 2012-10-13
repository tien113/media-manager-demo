module ApplicationHelper
  
  def full_title(page_title)
    base_title = "Media Manager"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end
  
  def resolutions
    %w[720p 1080p]
  end
  
end
