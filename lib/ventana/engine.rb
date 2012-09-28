module Ventana
  class Engine < ::Rails::Engine
    isolate_namespace Ventana
    config.generators do |g|
      g.test_framework :rspec, :view_specs => false
      g.integration_tool :rspec
    end

    config.to_prepare do
      ApplicationController.helper(Ventana::EditableContentHelper)
    end

    initializer 'ventana.initialize' do
      ActiveSupport.on_load(:action_view) do
        include Ventana::EditableContentHelper
      end
    end

    #initializer 'ventana.action_controller' do |app|
    #  ActiveSupport.on_load :action_controller do
    #    helper Ventana::EditableContentHelper
    #  end
    #end
  end
end
