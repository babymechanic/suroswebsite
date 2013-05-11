module Refinery
  module Presses
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Presses

      engine_name :refinery_presses

      initializer "register refinerycms_presses plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "presses"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.presses_admin_presses_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/presses/press',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Presses)
      end
    end
  end
end
