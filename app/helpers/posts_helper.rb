module PostsHelper
  # @@status_styles = Hash[
  #   'submitted' => 'uk-label',
  #   'approved' => 'uk-label uk-label-success',
  #   'rejected' => 'uk-label uk-label-warning'
  # ]

  # <span class="uk-width-1-1 uk-align-center <%= @status_styles[post.status] %>"><%= post.status.camelize %></span>

  def status_label status
    content_tag(:span, status, class: PostsHelper.status_styles[status])
  end

  private
    def self.status_styles
      Hash[
        'submitted' => 'uk-width-1-1 uk-align-center uk-label',
        'approved' => 'uk-width-1-1 uk-align-center uk-label uk-label-success',
        'rejected' => 'uk-width-1-1 uk-align-center uk-label uk-label-warning'
      ]
    end
end
