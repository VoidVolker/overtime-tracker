module PostsHelper
  # @@status_styles = Hash[
  #   'submitted' => 'uk-label',
  #   'approved' => 'uk-label uk-label-success',
  #   'rejected' => 'uk-label uk-label-warning'
  # ]

  # <span class="uk-width-1-1 uk-align-center <%= @status_styles[post.status] %>"><%= post.status.camelize %></span>

  def status_label status, tag_class = ''
    content_tag(:span, status, class: "#{PostsHelper.status_styles[status]} #{tag_class}")
  end

  private
    def self.status_styles
      Hash[
        'submitted' => 'uk-label',
        'approved' => 'uk-label uk-label-success',
        'rejected' => 'uk-label uk-label-warning'
      ]
    end
end
