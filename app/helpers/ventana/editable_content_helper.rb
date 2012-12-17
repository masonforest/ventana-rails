module Ventana
  module EditableContentHelper
    DEFAULT_TEXT = "Welcome to ventana, hover to edit."
    def editable_content_for(key, options={})
      options[:type] ||= :markdown
      @key = key
      @editable_content =
        Ventana::EditableContent.where(
          key: key.to_s,
          content_type: options[:type].to_s
      ).first ||
        Ventana::EditableContent.create(
          key: key.to_s,
          content_type: options[:type].to_s,
          value: "Welcome to ventana, hover to edit."
        )


      ventana_block
    end

    private

    def key
      @editable_content.key
    end

    def ventana_block
      content_tag(:div,
        (edit_link + editable_div),
          class: block_classes,
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
        class: "ventana-content").html_safe
    end

    def content
      @editable_content.render.html_safe
    end

    def edit_link
      if can_edit?
        link_to("Edit", ventana.edit_editable_content_path(@key), class: "ventana-edit")
      else
        "".html_safe
      end
    end

    def block_classes
      classes = ["ventana-block"]

      classes.tap do |classes|
        if can_edit?
          classes << "ventana-editable"
        end
      end
    end

    def can_edit?
      (defined? current_user) && current_user.try(:can_edit_with_ventana?)
    end
  end
end
