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

      ventana_block
    end

    private

    def key
      @editable_content.key
    end

    def ventana_block
      content_tag(:div,
        (edit_link + editable_div),
          class: "ventana-block",
          id: id,
          data: { key: key }
        ).html_safe

    end

    def id
      "ventana-#{@key}"
    end

    def editable_div
      content_tag(:div,
        content,
        class: "editable").html_safe
    end

    def content
      @editable_content.render.html_safe
    end

    def edit_link
      if (defined? current_user) && current_user.try(:can_edit?)
        link_to("Edit", ventana.edit_editable_content_path(@key), class: "edit")
      else
        "".html_safe
      end
    end
  end
end
