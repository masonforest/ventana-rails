module Ventana
  module EditableContentHelper
    def editable_content_for(key, options={})
      options[:type] ||= :text
      @key = key
      @editable_content =
        Ventana::EditableContent.where(
          key: key,
          content_type: options[:type]
      ).first_or_create

      (edit_link + editable_div).html_safe
    end
    private

    def key
      @editable_content.key
    end

    def editable_div
      content_tag(:div,
        content,
        id: @key,
        class: "editable").html_safe
    end

    def content
      @editable_content.render.html_safe
    end

    def edit_link
      if (defined? current_user) && current_user.try(:can_edit?)
        link_to("Edit", ventana.edit_editable_content_path(@key), class: "edit")
      else
        ""
      end
    end
  end
end