module Refinery
  module Exhibitions
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Exhibitions

      engine_name :refinery_exhibitions

      initializer "register refinerycms_exhibitions plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "exhibitions"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.exhibitions_admin_exhibitions_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/exhibitions/exhibition',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Exhibitions)
      end
    end
  end
end
