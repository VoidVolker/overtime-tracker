module PostsHelper
  def status_label status, tag_class = ''
    content_tag(:span, status, class: "#{PostsHelper.status_styles[status]} #{tag_class}")
  end

  # def save_link_to path, id
  #   PostsHelper.icon_link_to(
  #     PostsHelper.save_label,
  #     path,
  #     "save-#{id}",
  #     'uk-link-text'
  #   )
  # end

  # def save_button_to path, id
  #   PostsHelper.icon_link_to(
  #     PostsHelper.save_label,
  #     path,
  #     "save-#{id}",
  #     'uk-button uk-button-primary uk-width-expand'
  #   )
  # end

  def edit_link_to path, id
    PostsHelper.icon_link_to(
      PostsHelper.edit_label,
      path,
      "edit_#{id}",
      'uk-link-text'
    )
  end

  def edit_button_to path, id
    PostsHelper.icon_link_to(
      PostsHelper.edit_label,
      path,
      "edit_#{id}",
      'uk-button uk-button-default uk-width-expand'
    )
  end

  def delete_link_to path, id, record_type = ''
    PostsHelper.icon_link_to(
      PostsHelper.delete_label,
      path,
      "delete_#{id}",
      'uk-link-text',
      :delete,
      PostsHelper.delete_confirmation(id, record_type)
    )
  end

  def delete_button_to path, id, record_type = ''
    PostsHelper.icon_link_to(
      PostsHelper.delete_label,
      path,
      "delete_#{id}",
      'uk-button uk-button-danger uk-width-expand',
      :delete,
      PostsHelper.delete_confirmation(id, record_type)
    )
  end

  private
    def self.status_styles
      Hash[
        'submitted' => 'uk-label',
        'approved' => 'uk-label uk-label-success',
        'rejected' => 'uk-label uk-label-warning'
      ]
    end

    def self.delete_confirmation id, record_type
      { confirm: "Are you sure want to delete the #{record_type} \##{id}?"}
    end

    def self.icon_link_to content, path, id, tag_class, method = nil, data = nil
      ActionController::Base.helpers.link_to(
        content.html_safe,
        path,
        id: id,
        class: tag_class,
        method: method,
        data: data
      )
    end

    # def self.save_label
    #   PostsHelper.icon_text_label 'save', 'Save'
    # end

    def self.edit_label
      PostsHelper.icon_text_label 'edit', 'Edit'
    end

    def self.delete_label
      PostsHelper.icon_text_label 'trash-alt', 'Delete'
    end

    def self.icon_text_label icon, text
      "<i class=\"fas fa-#{icon}\"></i>&nbsp;#{text}"
    end
end
