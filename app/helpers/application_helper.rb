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
  
  def storages
    %w[9QK0MKKM 9VS27232 9VS12YSJ WMATV1209424 WMATV0866765 WMATV0238767 WCAVY5300636 WCAVY0044013 WMAVU0073837 WCALL1222473 WCAM9M594260 9QG2EZ1R 4NF1F731 4LJ1XF97]
  end
  
end
