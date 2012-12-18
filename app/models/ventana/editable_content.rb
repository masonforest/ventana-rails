require 'redcarpet'
require 'paper_trail'

module Ventana
  class EditableContent < ActiveRecord::Base
    has_paper_trail
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
