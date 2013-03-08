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
    if products_link_and_current?(link) || static_link_and_current?(link)
      "current"
    end
  end

  def tab(caption, path)
    content_tag :li, class: tab_class(path) do
      link_to caption, path
    end
  end

  def products_link_and_current?(link)
    [root_path, products_path].include?(request.fullpath) && link == products_path
  end

  def static_link_and_current?(link)
    ![root_path, products_path].include?(request.fullpath) && link.match(request.fullpath)
  end
end
