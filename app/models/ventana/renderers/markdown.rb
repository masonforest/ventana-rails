module Ventana
  module Renderers
    class Markdown
      def self.render(value)
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
          :autolink => true, :space_after_headers => true)
        markdown.render(value.to_s)

      end
    end
  end
end
