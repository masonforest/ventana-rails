require 'redcarpet'

module Ventana
  class EditableContent < ActiveRecord::Base
    attr_accessible :key, :cotent_type, :value
    def render
      case content_type.to_sym
      when :text
        value.to_s
      when :markdown
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
          :autolink => true, :space_after_headers => true)
        markdown.render(value.to_s)
      end
    end

    def to_param
      key
    end
  end
end
