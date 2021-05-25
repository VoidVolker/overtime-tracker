module ApplicationHelper
  def active?(path)
    'uk-active' if current_page?(path)
  end
end
