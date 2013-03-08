module ApplicationHelper
  def tabs(pages)
    content_tag :menu do
      tab("Store", products_path)+
      safe_join(pages.map do |page|
        tab(page.caption, static_page_path(page))
      end)
    end
  end

  private

  def tab_class(link)
    if link.match(request.fullpath)
      "current"
    end
  end

  def tab(caption, path)
    content_tag :li, class: tab_class(path) do
      link_to caption, path
    end
  end
end
