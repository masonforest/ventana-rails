require 'redcarpet'
module Ventana
  class EditableContent < ActiveRecord::Base
    attr_accessible :key, :content_type, :value
    def render
      renderer = Ventana::Renderers.const_get(content_type.to_s.classify)
      renderer.render(value)
    end

    def to_param
      key
    end
  end
end
