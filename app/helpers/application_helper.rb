module ApplicationHelper
  BASE_TITLE = 'Futsal'.freeze
  # html title
  def full_title(page_title)
    if page_title && page_title.length > 0
      BASE_TITLE + ' | ' + page_title
    else
      BASE_TITLE
    end
  end

end
