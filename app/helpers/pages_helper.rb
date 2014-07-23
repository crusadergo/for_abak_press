module PagesHelper

  def tree(pages, children_css_class)
    return unless pages.empty?

    capture_with_haml do
      haml_tag :div, class: children_css_class do
        pages.each do |page|
          haml_tag :span, page.title
          tree page.children, children_css_class
        end
      end
    end
  end

end
