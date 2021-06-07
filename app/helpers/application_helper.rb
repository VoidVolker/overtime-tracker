module ApplicationHelper
  def self.is_admin?(user)
    ApplicationController.is_admin?(user)
  end

  def is_admin?
    ApplicationController.is_admin?(current_user)
  end

  def active?(path)
    'uk-active' if current_page?(path)
  end

  def status_label status, tag_class = ''
    content_tag(:span, status, class: "#{ApplicationHelper.status_styles[status]} #{tag_class}")
  end

  private

    def self.status_styles
      Hash[
        'submitted' => 'uk-label',
        'approved' => 'uk-label uk-label-success',
        'rejected' => 'uk-label uk-label-warning',
        'pending' => 'uk-label',
        'confirmed' => 'uk-label uk-label-success'
      ]
    end
end
